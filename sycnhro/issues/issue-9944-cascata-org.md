# Cascata em camadas da CV

> Nivel 1
## V_CADASTRO_CALC_AUTOMATICOS[^1]
- [ ] CadastroCalculosAutomaticosRepositoryImpl ==JAVA==
- [x] V_CONFIGURACAO_CALC_AUTOMATICOS[^2]
- [x] V_INTERFACE_VALORES_CALCULADOS[^3] 
- [x] V_PREJUIZO_OPERACIONAL_AUTO[^4]
- [x] V_VALORES_CALCULADOS[^5]

[^1]: [Link](http://localhost:8000/#/ecf/cadastro_calculo_automatico). Essa CV segue. **Alteracoes na CV**: Deve mostrar da mesma forma da listagem.
[^2]: [Link](http://localhost:8000/#/ecf/calculos_automaticos_configurados). Deve mostrar da mesma forma que a listagem, aparecendo apenas uma vez para tributos que cadastram em ambos e duas vezes quando cadastrado para dois tributos.
[^3]: Usado no complemento -> ECF_CONFIG_AUTO_V_INCENTIVOS. Fluxo dos Calculos automaticos.
[^4]: Usado no complemento -> ECF_COMPENSACOES_LALUR_LACS. Fluxo dos Calculos automaticos
[^5]: [Link](http://localhost:8000/#/ecf/valores_calculados). Fim do fluxo dos valores calculados.



## V_CONTAS_PARTEB_DISPONIVEIS_CONFIGURAR ==LUGAR NENHUM==

## V_CONTAS_PARTEB_PROV_DISPONIVEIS_CONFIGURAR[^15]
- [ ] ContasConfiguradasParteBRepositoryImpl ==JAVA==

[^15]: Tem que ser retornado dados de um tributo só.

## V_CONTAS_PARTEB_SEM_LANCTO_NO_PERIODO[^16]
- [ ] /SYN/P_CRIA_LANCTOS_PARTE_B[^6] ==PROCEDURE==

[^16]: Segue o mesmo funcionamento. Possui placeholder na **P_TIPO_TRIBUTO**.
[^6]: Procedure usada em **ContasParteBRepositoryImpl**. E ja eh filtrada pelo placeholder.

## V_CTRL_VENCTO_SALDOS_PARTE_B[^17]
- [ ] ControleVencimentoSaldosParteBRepositoryImpl ==JAVA==
- [x] V_SALDOS_RELATORIO_SINTETICO [^19] ==Lugar nenhum do codigo== 
- [ ] /SYN/P_CTRL_VENCIMENTO_DO_PAT_PARTE_B[^7] ==PROCEDURE==

[^7]: Procedure usada em **ContasParteBRepositoryImpl**. 
[^17]: Adicionar tributo e verificar em qual momento é preenchido automaticamente para alterarmos, preencher usando um update baseado no CODIGO_OFICIAL_VALOR.

## V_LANCAMENTOS_ELALUR_LACS[^18] 
- [ ] /SYN/P_CRIA_LANCTOS_PARTE_B[^8] ==PROCEDURE==
- [ ] LanctoELacsLalurRepositoryImpl ==JAVA==

[^8]: Procedure usada em **ContasParteBRepositoryImpl**.
[^18]: VER COM MAIS ANTENCAO, A PARTE DE FILTRAR O TRIBUTO, E VERIFICAR SE FAZ SENTIDO REALMENTE OS DOIS JOINS

## V_LANCAMENTOS_SALDO_PARTEB_RELATORIO[^19] ==Lugar nenhum==

[^19]: TEMOS O TRIBUTO E PODEMOS FILTRAR

## V_SALDOS_CONTAS_CONFIGURADAS_TODAS[^20]
- [ ] V_LANCAMENTOS_SALDO_PARTEB_RELATORIO ==Lugar nenhum do codigo==
- [ ] ConfiguracaoEcfRepository ==JAVA==
- [x] V_BLOCO_M
- [x] V_BLOCO_N
- [x] V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA[^9]
- [x] V_IMPOSTO_DIFERIDO_DETALHADO [^21]
- [x] V_LANCAMENTOS_PARTEB_RELATORIO[^22]
- [x] /SYN/P_TRANSFERIR_SALDOS_PARTE_B[^10] ==PROCEDURE==

[^9]: Na tela de Apuracao - Balancete é usada para exportar os dados
[^10]: Procedure usada em **ContasControleParteBrepositoryImpl**.
[^20]: RECEBEMOS O PARAMETRO TRIBUTO.
[^21]: Deve manter o mesmo comportamento devido alteracao feita na CV que impacta essa
[^22]: Acredito que nada vai precisar ser alterado visto que ja eh levado em consideracao o tipo do tributo na CV.

## V_SALDOS_PARTE_B[^19]
- [ ] V_SALDOS_RELATORIO_SINTETICO ==Nada no  codigo==
- [ ] SaldosParteBEcfRepositoryImpl ==JAVA==
- [ ] V_BLOCO_M010
- [x] V_CONFIGURA_VALORES_PARTE_B
- [ ] V_CONTAS_PARTEB_DISPONIVEIS_CONFIGURAR ==Nada no codigo==
- [x] V_CTRL_VENCTO_SALDOS_PARTE_B ==Ja citado acima==
- [ ] ControleVencimentoSaldosParteBRepositoryImpl ==JAVA==
- [ ] V_PREJUIZO_OPERACIONAL_AUTO[^4]
- [ ] V_SALDOS_CONTAS_PARTEB_CONFIGURADAS[^11] ==Acredito que nao eh mais utilizado, analisar mais==
- [ ] /SYN/P_CTRL_VENCIMENTO_DO_PAT_PARTE_B[^7] ==PROCEDURE==

[^11]: [Link](http://localhost:8000/#/ecf/apuracao/valor_parte_b/parte_a(X)adicao(X)valor_parte_b/IRPJ/2000/202201/adicao)

## V_SALDOS_CONTAS_PADRAO_PARTE_B
- [x] SaldoContaPadraoParteBrepositoryImpl ==JAVA==
- [x] SUMARIO_BLOCO_M ==COMPLEMENTO -> Origem==

> Nivel 2
## ~~V_CONFIGURACAO_CALC_AUTOMATICOS~~
- [ ] ~~V_CADASTROS_DISPONIVEIS_CONFIGURAR~~ [^13]
- [ ] ~~V_CONFIGURA_VALORES_AUTOMATICOS~~

[^13]: [Link](http://localhost:8000/#/ecf/cadastros_disponiveis_configuracao/forma_utilizacao/01?periodo_apuracao=A01)

## ~~V_INTERFACE_VALORES_CALCULADOS~~ [^3]
- [ ] ECF_CONFIG_AUTO_V_INCENTIVOS ==COMPLEMENTO -> Origem==

## V_PREJUIZO_OPERACIONAL_AUTO[^4]
- [ ] ECF_COMPENSACOES_LALUR_LACS ==COMPLEMENTO -> Origem==

## V_VALORES_CALCULADOS
- [ ] ValoresCalculadosRepositoryImpl ==JAVA==
- [x] V_CONFIGURA_VALORES_AUTOMATICOS
- [x] V_INTERFACE_VALORES_CALCULADOS[^3]
- [ ] ECF_INCENTIVOS ==COMPLEMENTO -> Origem==
- [ ] ECF_INCENTIVO_LUCRO_NAO_OP ==COMPLEMENTO -> Origem==
- [ ] ECF_VALOR_LIMITE_COLETIVO ==COMPLEMENTO -> Origem==
- [ ] /SYN/AJUSTA_LIMITE_COLETIVO ==PROCEDURE==

## V_BLOCO_M
- [x] ECF_BLOCO_M ==COMPLEMENTO -> ORIGEM==

## V_BLOCO_N
- [x] ECF_BLOCO_N ==COMPLEMENTO -> ORIGEM==

## V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA[^9]
- [x] ApuracaoBalanceteRepositoryImpl ==JAVA==
- [x] ConfiguracoesBalanceteRepositoryImpl ==JAVA==

## V_IMPOSTO_DIFERIDO_DETALHADO
- [x] V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA[^14]
- [x] V_RELATORIO_ANALITICO_DIFERIDO
- [x] ImpostoDiferidoRepositoryImpl ==JAVA==

[^14]: CV usada no código para persistir o relatorio da Apuracao Detalhada `ApuracaoBalanceteRepository > persisteApuracaoDetalhadaRelatorio`

## V_LANCAMENTOS_PARTEB_RELATORIO ==Nao é usado em lugar nenhum no codigo==

## V_BLOCO_M010
- [ ] ECF_BLOCO_M010 ==COMPLEMENTO -> Origem==

## V_CONFIGURA_VALORES_PARTE_B
- [ ] ECF_VALORES_INCENTIVOS_CONFIG ==COMPLEMENTO -> Origem==

## V_CTRL_VENCTO_SALDOS_PARTE_B
- [ ] ControleVencimentoSaldosParteBRepositoryImpl ==JAVA==
- [ ] V_SALDOS_RELATORIO_SINTETICO ==Nada no codigo==
- [ ] /SYN/P_CTRL_VENCIMENTO_DO_PAT_PARTE_B ==PROCEDURE==

## V_SALDOS_CONTAS_PARTEB_CONFIGURADAS
- [ ] ContasConfiguradasParteBRepositoryImpl ==JAVA==
- [ ] ImpostoDiferidoRepositoryImpl ==JAVA==
- [x] V_BLOCO_M
- [x] V_BLOCO_N
- [x] V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA[^14]
- [x] V_IMPOSTO_DIFERIDO_DETALHADO
- [ ] /SYN/P_TRANSFERIR_SALDOS_PARTE_B ==PROCEDURE==

> Nivel 3
## ~~V_CADASTROS_DISPONIVEIS_CONFIGURAR~~
- [ ] ~~CadastrosDisponiveisConfiguracaoRepositoryImpl~~ ==JAVA==

## ~~V_CONFIGURA_VALORES_AUTOMATICOS~~
- [ ] ~~ECF_VALORES_INCENTIVOS_CONFIG~~ ==COMPLEMENTO -> Origem==
- [ ] ~~V_CONFIGURA_VALORES_PARTE_B~~

## ~~V_CONFIGURA_VALORES_PARTE_B~~
- [ ] ~~V_CONFIGURA_VALORES_PARTE_B~~
- [ ] ~~ECF_VALORES_INCENTIVOS_CONFIG~~ ==COMPLEMENTO -> Origem==

---

# Cascata em camadas da TABELA

## V_CONTAS_CONTROLE_PARTE_B ==Callout acima==
- [ ] ContasControleParteBRepositoryImpl ==JAVA==

## V_CONTAS_CONTROLE_SALDOS
- [ ] /SYN/P_TRANSFERIR_SALDO_INICIAL_B ==PROCEDURE==

- [ ] CRITICAS_ECF_PARTEB_PARTEA ==COMPLEMENTO -> Origem==

## V_CRITICA_SALDO_CONTA_CONTROLE
- [ ] CRITICAS_ECF ==COMPLEMENTO -> Origem==

## ecf/V_IDENTIFICACAO_CONTA_PARTE_B e V_IDENTIFICACAO_CONTA_PARTE_B_BACKUP
- [ ] IdentContaParteBRepositoryImpl ==JAVA==

## V_LANCAMENTOS_PARTEB_RELATORIO
- [ ] V_LANCAMENTOS_SALDO_PARTEB_RELATORIO

## V_MOV_SALDO_INICIAL_PARTE_B
- [ ] ECF_TRANSFERE_SALDO_INICIAL ==COMPLEMENTO -> Origem==

## CRITICAS_ECF
- [ ] EtapasApuracaoProcess ==JAVA==

## /SYN/P_TRANSFERIR_SALDOS_PARTEB ==PROCEDURE==
- [ ] ContasControleParteBRepositoryImpl ==JAVA==

---

> [!NOTE] Funcionalidades impactadas
- [x] SPED > ECF > Cálc. Automáticos da Apuração > Cadastro de Cálculos Automáticos da Apuração
	-  ==Deve mostrar apenas um registro por mais que a conta controle seja cadastrada em dois tributos==
- [ ] SPED > ECF > Cálc. Automáticos da Apuração > Configurações dos Cálculos
	- ==Deve mostrar apenas um, porem== **é só contabil, não tem parte B**
- [ ] SPED > ECF > Cálc. Automáticos da Apuração > Valores dos Cálculos
	- ==Faz sentido ter os dois tributos aqui, visto que existe a coluna tributo na listagem==
- [ ] SPED > ECF > Apuracao - Balancete > **Parte B** > **Associar Contas**
	- ==Precisa mostrar os valores referentes a cada tributo, mas só é mostrado um por vez **Mesmo comportamento**==
- [ ] SPED > ECF > Apuracao - Balancete > Acoes -> Etapas Apuracao -> **STEPS** Atualiza saldos da Parte B / Atualizar Cálculos Automáticos / Gerar Bloco N / Criticas ECF
	- Atualiza Saldos da Parte B
		- ==Popula os lançamentos e saldos e deve ter duas linhas caso tenha LALUR e LACS==
	- Atualizar Cálculos Automáticos
		- ==Deve ter duas linhas, porque popula a parte dos Valores dos Cálculos==
	- Gerar Bloco N
		- ==Não altera a parte b==
	- Criticas ECF
		- ==Faz sentido colocar o Tributo que teremos no ID_FUNCIONAL==
- [ ] SPED > Parte B > Controle de Vencimentos
	- ==Como tem o CODIGO_OFICIAL e CONTA_CONTROLE na listagem, devemos mostrar os dois== **Vai ter outra issue pra refazer ele então, mas ver com o felipe onde tem dados pra fazer parecido com a conciliação** ==Com relação a parte de fazer parecido com a conciliação acredito que nao de muito certo por conta do codigo oficial que é diferente==
- [ ] SPED > Bloco L, M, N > Lançamentos Parte-B (M410)
	- ==Precisa ter os dois tributos pra listar nessa tela==
- [ ] SPED >  Apuracao - Balancete > Parte A -> Valores Contábeis
	- ==Precisa mostrar os valores referentes a cada tributo, mas só é mostrado um por vez **Mesmo comportamento**==
- [ ] SPED >  Apuracao - Balancete > Acoes -> Exportar dados
	- ==Deve trazer registro para os dois tributos se houver==
- [ ] SPED >  Imposto Diferido > IRPJ/CSLL
	- ==Precisa mostrar os valores referentes a cada tributo, mas só é mostrado um por vez **Mesmo comportamento**==
- [ ] SPED > Bloco L, M, N > Ident. Conta Parte B (M010)
	- ==Precisa listar ambos os tributos juntos==
- [ ] SPED >  Apuracao - Balancete > Parte A -> Parte B
	- ==Precisa mostrar os valores referentes a cada tributo, mas só é mostrado um por vez **Mesmo comportamento**==
- [ ] SPED > ECF > Sumário da Obrigacao
	- ==Como o M510 deve ser apresentado no SUMARIO?== **Fazer o JOIN por tributo pra buscar a descricao correta**
- [ ] SPED > ECF > Cálc. Automáticos da Apuracao > Configuracões dos Cálculos -> Associar Contas
	- ==Deve mostrar apenas um, porem **não tenho certeza**== **Como é contabil não vamos alterar**
---
# Análise

> [!NOTE] Verifica se o campo CONTA_CONTROLE_CODIGO_OFICIAL_VALOR está sendo projetado

- V_CADASTRO_CALC_AUTOMATICOS ==ok==
> **Não precisa de fato do tributo, mas é recuperado no JOIN**
> CadastroCalculosAutomaticosRepositoryImpl ==Da conta Controle so temos no TO **CODIGO** e **DESCRICAO**==
> ~~V_CONFIGURACAO_CALC_AUTOMATICOS~~ ==ok== 
> ~~V_INTERFACE_VALORES_CALCULADOS~~ ==ok==
> ~~V_PREJUIZO_OPERACIONAL_AUTO~~ ==ok==
> ~~V_VALORES_APUR_BAL_SUS_CALC_AUTO~~ ***NOVO*** ==ok==
> V_VALORES_CALCULADOS ==Projeta campo **VALOR** ate a semantics e é necessario em complemento== ==ok==

- V_VALORES_CALCULADOS ==ok==
> ~~V_CONFIGURA_VALORES_AUTOMATICOS~~ ==ok==
> ~~V_ENTRADA_AJUSTE_FISCAIS_IRPJ_CSLL_VALORES_CALCULADOS~~ ***ATC*** ==ok==
> ~~V_INTERFACE_VALORES_CALCULADOS~~ ==ok==

- V_CONTAS_PARTEB_PROV_DISPONIVEIS_CONFIGURAR ==ok==
> É usado para filtrar os valores e fazer JOIN, mas não chega na semantics

- V_CONTAS_PARTEB_SEM_LANCTO_NO_PERIODO ==ok==
> É usado para filtrar os valores na projection P_CONTAS_CONTROLE e chega até o semantics

- V_CTRL_VENCTO_SALDOS_PARTE_B ==ok==
> O valor é recuperado, não é usada para nada nessa CV, mas vai até a semantics
> ~~V_SALDOS_RELATORIO_SINTETICO~~
> /SYN/P_CTRL_VENCIMENTO_DO_PAT_PARTE_B ==Utiliza campo VALOR para adicionar em /TMF/LNCTOBSRA== ==ok==
> ControleVencimentoSaldosParteBRepositoryImpl ==Possui o campo contaControle em seu TO,  mas pelo que vi, so usamos o codigo e nada mais== ==ok==

- V_LANCAMENTOS_ELALUR_LACS ==ok==
> [!warning] Conversar depois
> ~~Dois JOINs seguidos da mesma CV~~ ==Precisa sim, o JOIN eh feito em codigos diferentes==

> Acredito que deve ficar a mesma coisa pois na tela temos, o tributo, I  e C 

- V_SALDOS_CONTAS_CONFIGURADAS_TODAS ==ok==
> **Não precisa de fato do tributo, mas é recuperado no JOIN** (só ter certeza que o valor nao esta duplicando)
> ~~V_BLOCO_M~~ ==ok==
> ~~V_BLOCO_N~~ ==ok==
> ~~V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA~~ ==ok==
> ~~V_ENTRADA_AJUSTES_FISCAIS_IRPJ_CSLL_SALDOS_CONTAS~~ ==ok==
> ~~V_IMPOSTO_DIFERIDO_DETALHADO~~ ==ok==
> ~~V_LANCAMENTOS_PARTEB_RELATORIO~~ ==ok==
> V_LANCAMENTOS_SALDO_PARTEB_RELATORIO ==Utiliza o Codigo Oficial, mas nao o VALOR, e nao consegui achar no codigo onde que eh usada essa CV==
> ~~V_VALORES_APUR_BAL_SUS_CALC_AUTO~~ ==ok==
> ~~/SYN/P_TRANSFERIR_SALDOS_PARTE_B~~

- V_SALDOS_PARTE_B ==ok==
> Como já temos o TRIBUTO persistido na tabela, acredito que seria bom, melhorar os atributos que sobem nessa CV
> V_BLOCO_M010 (Não vai precisar de alteração por conta de como estamos fazendo nos SALDOS, não duplicando a linha) ==ok==
> ~~V_CONFIGURA_VALORES_PARTE_B~~
> V_CONTAS_PARTEB_DISPONIVEIS_CONFIGURAR ==ok==
>~~V_CONTAS_PARTEB_PROV_DISPONIVEIS_CONFIGURAR~~ ==A respeito dos saldos o CODIGO_OFICIAL nao eh utilizado, apenas o tributo== ==ok==
>~~V_CTRL_VENCTO_SALDOS_PARTE_B~~ ==ok==
>V_PREJUIZO_OPERACIONAL_AUTO (**Acredito que esteja tudo certo, porque tanto na esquerda quanto na direita ja tratamos os dados pra nao duplicar, entao o JOIN deve acontecer normalmente**)
>V_SALDOS_CONTAS_PARTEB_CONFIGURADAS
>~~V_SALDOS_RELATORIO_SINTETICO~~ (**Talvez faça sentido fazer JOIN tambem pelo codigo e valor, visto que esta presente em ambos os lados, pra evitar duplicacao**)
>/SYN/P_CTRL_VENCIMENTO_DO_PAT_PARTE_B ==Utilizo na procedure o CODIGO_OFICIAL== ==ok==

- V_BLOCO_M010 ==ok==
> Aparentemente o comportamento esperado aqui é subir os dois tributos, visto que o VALOR só é usado para deduzir o TRIBUTO


- V_CONTAS_PARTEB_DISPONIVEIS_CONFIGURAR (**Mapeei o tributo para poder subir apenas o necessario sem duplicacao**)
> **Sobe o CODIGO_OFICIAL_VALOR, mas não usa pra nada em especifico e não consegui achar uso dessa CV**

- V_PREJUIZO_OPERACIONAL_AUTO ==Ja citado acima==
> ECF_COMPENSACOES_LALUR_LACS ==CODIGO_OFICIAL utilizada para filtrar==

- V_SALDOS_CONTAS_PARTEB_CONFIGURADAS ==ok==
> ~~V_BLOCO_M~~
> ~~V_BLOCO_N~~

- V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA
> Não sobe em momento algum, mas está presente nos **Input Parameters**

- V_SALDOS_CONTAS_PADRAO_PARTE_B
> É necessario o CODIGO_OFICIAL, podemos repetir tributo, visto que temos a coluna e é mostrada na listagem do frontend

- V_IMPOSTO_DIFERIDO_DETALHADO
> Possui o **Input Parameter**, mas não é projetado em momento algum o CODIGO_OFICIAL
> ~~V_RELATORIO_ANALITICO_DIFERIDO~~
> ~~V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA~~

- V_RELATORIO_ANALITICO_DIFERIDO
> Possui o **Input Parameter**, e não temos nem a possibilidade de projetar o campo CODIGO_OFICIAL

- V_LANCAMENTOS_PARTEB_RELATORIO
> Temos o CODIGO_OFICIAL, porque é buscado na tabela de CONTA_CONTROLE_PARTE_B

- V_BLOCO_M010
> Possui COD_TRIBUTO

- V_CONFIGURA_VALORES_PARTE_B
> Possui COD_TRIBUTO



## Tabela
- V_CONTAS_CONTROLE_PARTE_B ==ok==
> Deve manter o funcionamento atual de dois TRIBUTOS para o mesmo CODIGO_OFICIAL, caso seja possivel
> Deve fazer com que seja possível adicionar outro TRIBUTO para o mesmo CODIGO_OFICIAL, desde que so exista um LALUR e um LACS

- V_CONTAS_CONTROLE_SALDOS ==ok==
> Cria coluna calculada TIPO_TRIBUTO e filtra para que só saldos positivos sejam levados em consideração

- V_CRITICAS_PARTEB_PARTEA ==ok==
> Nesse caso vai duplicar o registro, mas podemos fazer o JOIN usando o TRIBUTO que vamos ter agora

- V_IDENTIFICACAO_CONTA_PARTE_B ==ok==
> Nessa CV buscamos apenas a descricao da Conta Controle, dessa forma duplicaria o registro, para isso podemos usar o COD_TRIBUTO presente na fonte dos dados

- V_LANCAMENTOS_PARTEB_RELATORIO
> ==?==
> Não sei onde é usado e qual o comportamento esperado na tela, mas é buscado o CODIGO_OFICIAL

- V_MOV_SALDO_INICIAL_PARTE_B ==ok==
> Aqui é separado LALUR e LACS mais a frente então precisamos dos dois tributos separadamente

- CRITICAS_ECF 
> Como V_CRITICA_SALDO_CONTA_CONTROLE ==ok==, funciona apenas para demonstrar se o ANO < ANO_CRIAÇÃO, acredito que seja interessante adicionar o TRIBUTO para mostrarmos qual o registro que está sendo criticado no ID_FUNCIONAL

- /SYN/P_TRANSFERIR_SALDOS_PARTE_B ==ok==
> Acredito que vai ser necessario adicionar o TRIBUTO no WHERE para poder usar o EXISTS corretamente

---
## CVs para versionar (==Pacote 9944==)
- [ ] V_CONTAS_CONTROLE_PARTE_B
- [ ] V_CADASTRO_CALC_AUTOMATICOS
- [ ] V_SALDOS_CONTAS_CONFIGURADAS_TODAS
- [ ] V_CTRL_VENCTO_SALDOS_PARTE_B
- [ ] V_LANCAMENTOS_ELALUR_LACS
- [ ] V_SALDOS_PARTE_B
- [ ] V_CONFIGURA_VALORES_PARTE_B
- [ ] V_SALDOS_RELATORIO_SINTETICO
- [ ] V_CONTAS_PARTEB_DISPONIVEIS_CONFIGURAR (**Não tem manageMapping** ==Não consegui encontrar onde é utilizada==)

## Refatoracoes pra o futuro
- [ ] V_CONTAS_PARTEB_PROV_DISPONIVEIS_CONFIGURAR
