
> [!NOTE] # [Chamado: 3318887] [ECF] - LALUR PARTE B - Erro ao configurar códigos de conta iguais para os dois tributos.
> Ao cadastrar ou importar os dados para cadastro das contas da parte B (Listagem de Contas Controle - Parte B) a funcionalidade apresenta erro quando o mesmo código é utilizado para os dois tributos.

- Na tabela **/SYN/CONTA_CONTROLE_PARTE_B** a UK é definida apenas por MANDT, EMPRESA e CODIGO
- O código oficial é usado para definir se é o registro é LALUR ou LACS


> [!tip] Abordagem escolhida para fazer a analise
> Escolhemos adicionar a coluna do tributo e adicionar ela para também fazer parte da UK

### Uso do da CV e tabela na aplicação e analise de impacto
- CV: **V_CONTAS_CONTROLE_PARTE_B**
	- ecf/V_CADASTRO_CALC_AUTOMATICOS ==Mesma forma da listagem==
		- ==MANDT, EMPRESA e CODIGO== no JOIN (J_CADASTRO_CONTA_C) para buscar alguns outros valores
		- **Comportamento**
			- Atual: O comportamento era de apenas uma linha presente por código independente se esse codigo podia estar presente tanto em CSLL quando no IRPJ
			- Novo: O comportamento é que podem existir de 0 até duas linhas referente ao CODIGO, sendo a diferenca entre eles o valor do CODIGO_OFICIAL e o TRIBUTO. Essa CV precisa apenas de um registro por código sem diferenciar por TRIBUTO?
			- **Obs**: Nesse caso temos a possiblidade de recuperar o tributo cadastrado nos calculos automaticos para o JOIN ser mais especifico com relacao a o que subir, mas se ficar um LEFT JOIN vai acabar gerando um plano 2x2
	- ecf/V_CONTAS_PARTEB_DISPONIVEIS_CONFIGURAR =**SEM USO**==
		- ==MANDT, EMPRESA e CODIGO== no JOIN (J_EXCEPTION) para buscar alguns outros valores
		- **Comportamento**
			- Atual: Junta os SALDOS_PARTE_B  e as CONTAS_CONTROLE_PARTE_B diferenciando por TIPO (M e A)
			- Novo: Passariamos a ter duas linhas no máximo e não mais uma, sendo assim necessario cadastrar duas contas no caso em que esse CODIGO esteja em dois CODIGOS_OFICIAIS ou ate mesmo no mesmo CODIGO_OFICIAL (Lembrar de não trazer essa restricão para o usuário)
	- ecf/V_CONTAS_PARTEB_PROV_DISPONIVEIS_CONFIGURAR ==Tem que ser retornado dados de um tributo só==
		- ==MANDT, EMPRESA, CODIGO, PERIODO, ANO e TIPO_TRIBUTO (Campo calculado que vem do placeholder)== no JOIN (J_SALDOS_PARTE_B) para buscar alguns outros valores
		- **Comportamento**
			- Atual: só nos é retornado no máximo um registro por CODIGO referentes se existe saldo no ANO, PERIODO  e TRIBUTO.
			- Novo: pode nos retornar até dois registros referentes ao mesmo CODIGO
	- ecf/V_CONTAS_PARTEB_SEM_LANCTO_NO_PERIODO ==Segue o mesmo funcionamento==
		- ==EMPRESA== unico campo usado no JOIN (J_CTA_PERIODOS)
		- **Comportamento**
			- Atual: A projection P_CONTAS_CONTROLE só possui uma linha por CODIGO e CODIGO_OFICIAL_VALOR (TRIBUTO)
			- Novo: Pode ter até dois registros com tributos diferentes
	- ecf/V_CTRL_VENCTO_SALDOS_PARTE_B ==Adicionar tributo e verificar em qual momento é preenchido automaticamente para alterarmos, preencher usando um update baseado no CODIGO_OFICIAL_VALOR==
		- ==MANDT, EMPRESA e CODIGO== no JOIN (J_VENCTO_CTA_B) para buscar alguns outros valores
		- **Comportamento**
			- Atual: Retorna no maximo uma linha por tributo no JOIN
			- Novo: Retorna no máximo duas linhas por tributo, sendo uma referente a cada tributo
	- ecf/V_LANCAMENTOS_ELALUR_LACS (Verificar JOIN 2 e 3 que sao feitos com a mesma CV, se eh realmente necessario) ==**VER COM MAIS ANTENCAO, A PARTE DE FILTRAR O TRIBUTO, E VERIFICAR SE FAZ SENTIDO REALMENTE OS DOIS JOINS**==
		- ==MANDT, EMPRESA, EMPRESA_CNPJ e CODIGO== no JOIN (JOIN_2) para buscar alguns outros valores
		- **Comportamento** ==**ANALISAR DEPOIS**==
			- Atual: 
			- Novo: 
	- ecf/V_LANCAMENTOS_SALDO_PARTEB_RELATORIO (Projecao que usa a tabela nao sobe o CODIGO_OFICIAL, e acima na PROJ_3 eh feito um JOIN so pra isso) ==TEMOS O TRIBUTO E PODEMOS FILTRAR==
		- ==MANDT, EMPRESA e CODIGO== no JOIN (JOIN_4) para buscar alguns outros valores
		- **Comportamento**
			- Atual: Usado apenas para buscar o codigo oficial pelo codigo
			- Novo: O comportamento seguiria inalterado
	- ecf/V_SALDOS_CONTAS_CONFIGURADAS_TODAS ==RECEBEMOS O PARAMETRO TRIBUTO==
		- ==MANDT, EMPRESA e CODIGO== no JOIN (JOIN_9) para buscar alguns outros valores
		- **Comportamento**
			- Atual: Buscamos todos os dados da VIEW usando o CODIGO
			- Novo: Pode ser retornado duas linhas para o mesmo código
	- ecf/V_SALDOS_CONTAS_PADRAO_PARTE_B
		- ==MANDT, EMPRESA e CODIGO== no JOIN (J_SALDOS_SEM_AGG) para buscar alguns outros valores
		- **Comportamento**
			- Atual: Vai ser feito uma relacao de Nx1 porque da nossa CV so pode vir um registro por CODIGO
			- Novo: Poderá vir 2 registros com o mesmo CODIGO, verificar se isso vai impactar a funcionalidade
	- ecf/V_SALDOS_PARTE_B ==POSSUI A COLUNA TRIBUTO PRRA APLICARMOS A LOGICA==
		- ==MANDT, EMPRESA e CODIGO== no JOIN (J_SALDO_CONTROLE) para buscar alguns outros valores
		- **Comportamento**
			- Atual: Usado basicamente para buscar o CODIGO_OFICIAL e a DESCRICAO do CODIGO
			- Novo: Com linhas com o mesmo CODIGO, estariamos colocando descricoes diferentes e codigos oficiais diferentes
--- 
- Tabela: **/SYN/CONTA_CONTROLE_PARTE_B**
	- ContasControleParteBRepositoryImpl ==JAVA==
		- Apenas o Repository
	- ecf/V_CONTAS_CONTROLE_PARTE_B ==CV citada acima==
		- Usado para listagem
		- **Comportamento**
			- Atual: Apenas projeta os dados presentes na tabela e faz JOIN com V_ESTABELCIMENTO e V_TABELAS_DOMINIO
			- Novo: Seria mostrado duas linhas por codigo, caso não fizermos algum tratamento
	- ecf/V_CONTAS_CONTROLE_SALDOS ==Vai ficar da forma que está basicamente==
		- Usado PROCEDURE **/SYN/P_TRANSFERIR_SALDO_INICIAL_B**
			- Popula a tabela `/SYN/SALDO_INICIAL_PARTE_B` com base na FORMA_APUR
		- É usado uma união para transformar as colunas separadas em uma coluna só
			- **Comportamento**
				- Atual: Separa em duas projecoes cada uma referente a um tributo, para fazer a uniao do valor e indicador posteriormente e também termos o tipo do tributo
				- Novo: Com o tributo nao seria necessario termos duas projecoes ja que isso é feito apenas para deduzir o TRIBUTO
	- ecf/V_CRITICAS_PARTEB_PARTEA
		- Usado no complemento **CRITICAS_ECF_PARTEB_PARTEA**
		- No JOIN_1 da tabela a nossa tabela é utilizada para subir o código oficial fazendo o JOIN com ==MANDT, EMPRESA e CODIGO==
			- **Comportamento**
				- Atual: Apenas uma linha é permitida por codigo
				- Novo: Seriam permitidas até duas linhas por codigo
	- ecf/V_CRITICA_SALDO_CONTA_CONTROLE ==Verificar o impacto de trocar a tabela pela CV  e temos o TRIBUTO na origem dos dados pra filtrar apenas o necessario==
		- Usado no complemento **CRITICAS_ECF**
		- JOIN_1 ==MANDT, EMPRESA, CONTA_CONTROLE== para buscar DT_CRIACAO
			- **Comportamento**
				- Atual: vai subir apenas um registro da nossa tabela, referente a Tabela dos saldos
				- Novo: vai subir 2 registros com o mesmo codigo na nossa tabela, referente a Tabela dos saldos
	- ecf/V_IDENTIFICACAO_CONTA_PARTE_B e V_IDENTIFICACAO_CONTA_PARTE_B_BACKUP ==TEMOS TRIBUTO NA FONTE DA CV==
		- Só é pego a descrição da tabela ==Ter dois códigos iguais poderia gerar linhas duplicadas==
			- **Comportamento**
				- Atual: Buscar a descricao com base no CODIGO
				- Novo: teria o caso de estar repetido, pois o mesmo CODIGO_OFICIAL TERIA duas linhas
	- ecf/V_LANCAMENTOS_PARTEB_RELATORIO ==TEMOS O TRIBUTO NA FONTE DA CV==
		- CV usada em V_LANCAMENTOS_PARTEB_RELATORIO
		- A tabela é usada para pegar a DESCRICAO e CODIGO_OFICIAL
			- **Comportamento**
				- Atual: Busca a DESCRICAO e CODIGO_OFICIAL caso exista
				- Novo: Pode existir duas descricoes para o mesmo codigo com CODIGO_OFICIAL_DIFERENTE, fazendo com que para uma linha do JOIN que é fonte do nosso JOIN, possa retornar duas
	- ecf/V_MOV_SALDO_INICIAL_PARTE_B ==NAO EH USADO, MAS DEVEMOS MANTER FUNCIONAL, PARA CASO O CLIENTE QUEIRA USAR==
		- Usado no complemento **ECF_TRANSFERE_SALDO_INICIAL**
		- ==MANDT, EMPRESA e CODIGO== são usados no JOIN_1 podendo fazer com que tenham linhas duplicadas
			- **Comportamento**:
				- Atual: Aqui é usada como fonte principal dos dados, so precisariamos saber se o mesmo saldo entraria para os dois codigos mesmo sendo usados em tributos diferentes
				- Novo: Nessa CV precisamos de duas linhas caso o codigo esteja cadastrado no LALUR e LACS, mas pelo que da a entender na CV sempre devemos mostrar como LALUR e LACS mesmo que não seja um tributo exclusivo do LALUR cadastrado
	- CRITICAS_ECF ==COMPLEMENTO CONDICAO== **==MANTÉM O COMPORTAMENTO==**
		- **Comportamento**
			- Atual: Verifica se o CODIGO não está presente na lista de todos os CODIGOS existenes para uma empresa
			- Novo: Não sei se vai impactar ter dois códigos iguais ou teremos que fazer uma verificacao olhando para cada tributo
	- /SYN/P_TRANSFERIR_SALDOS_PARTE_B ==PROCEDURE== **==PASSAR A LEVAR EM CONSIDERACAO TAMBEM O TRIBUTO NO EXISTS==**
		- Usada só pra verificar se existe a conta
			- **Comportamento**
				- Atual: Faz a apenas a verificacao usando CODIGO tem que dar match com CONTA_SOCIETARIA_CONTA_CONTROLE_CODIGO, para a condicao `EXISTS` dar certo
				- Novo: Como temos o TIPO_TRIBUTO_CODIGO na CV que utilizamos para fazer o WHERE talvez seria interessante usarmos no WHERE também, já que teremos um registro para cada tributo
---

> [!NOTE] # Anotacoes pós reunião

- Abordagem escolhida: **Adicionar TRIBUTO na UK da tabela /SYN/CONTA_CONTROLE_PARTE_B**
- Desabilitar os indicadores também, porque só está desabilitando o Valor
- Nos usos da CV e tabela, mapear os impactos e nao o que é feito com a nossa fonta exemplo: **Ao adicionar o tributo permitido existir até 2 valores saindo do JOIN, pois da nossa parte teria uma linha pra o IRPJ  e outra pra o CSLL, ==qual o real impacto disso?==**
	- A gente a possibilidade de recuperar o Tributo nos JOINs
- Verificar o Comportamento que vai ficar ao realizar essa alteracao
- Tentar manter a tela inalterada apesar das alteracoes presentes no banco
- Verificar a possibilidade de na edicao permitir apenas alterar os valores
- No nosso novo update vao ter 2 updates para atualizar cada linha com seu respectivo valor e indicador
- Fazer um texto explicando cada impacto e caso nao consiga coloco uma interrogação, e sigo olhando os casos
- Faz sentido uma V2?
- Envolver apenas o Thiago e Matheus de inicio e quando tivermos mais encaminhados antes de desenvolver envolver O Felipe ou Lucas

### Ideias ao longo do processo
- Manter a CV da forma que está, sendo assim apesar de a tabela possuir 2 registros a CV só mostra um com os 2 valores
	- Qual o impacto que isso causa quando os registros são cadastrados em CODIGOS_OFICIAIS QUE só aceitam um TRIBUTO

---


## Ideias ao longo da segunda reuniao
- Qual o impacto ao remover ao deixar uma coluna unica para o valor e uma unica para o indicador
- Porque nao usar ENUM no banco?
- tratar para o combo da conta controle parte b não exibir o mesmo codigo duas vezes (vai ter um pra cada tributo)?
- Como resolver o problema de cadastrar o mesmo codigo com descrições diferentes?
	- Deixar cadastrar mas mostrar a primeira descricao no momento do JOIN
	- Validação no proprio JAVA, que ao criar um novo registro, desde que o codigo oficial nao seja ambos, verificar se o codigo ja existe, caso exista indicar para o usuario, que a descrição deve ser a mesma.

---
## Validação de comportamento
1. Contas controles repetidas em combos