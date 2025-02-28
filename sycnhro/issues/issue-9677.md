> [!NOTE] # [Chamado: 3309435] [ECF] - [Besni] Continuação do chamado 3237153

> Para definir as alíquotas especificas para cada período a **Qualificação da Pessoa Jurídica** deve ser 02 - PJ Componente do Sistema Financeiro.

## Definições técnicas
- Fazer com que seja possível definir as alíquotas para cada período para todas as **Qualificações**
- Isso é necessário pois a alíquota é liberada no meio do ano, mas o manual é só no fim do ano, então o cliente precisa mudar a alíquota no meio do ano, sem termos que adicionar novos metadados pra isso de forma paliativa

## Análise técnica
- [x] **CV**: V_PARAMETROS_ALIQUOTAS_ECF
	- [x] V_CONFIGURA_VALORES_AUTOMATICOS (**Transforma a ALIQ_CSLL em um Valor numérico**)
		- [x] V_CONFIGURA_VALORES_PARTE_B (**Não passa pra frente a ALIQ_CSLL**)
		- [x] ECF_VALORES_INCENTIVOS_CONFIG (**Não utiliza o ALIQ_CSLL**)
	- [x] V_PARAMETROS_ECF
	- As outras CVs que utilizam ela nem utilizam o IND_ALIQ_CSLL
	- IND_ALIQ_CSLL no backend
		- [x] ApuracaoEcfServiceImpl
		- [b] CalculoApuracaoServiceImpl 
			- [ ] CalculoApuracaoServiceImpl.aliquotaCsll
		- [x] ParametrosEcfRepositoryImpl (**Insert e update do questionario**)

---
### Sugestão
#### Frontend
- No frontend temos que deixar a checkbox para o usuario clicar e caso ele queira pode colocar as aliquotas CSLL diferentes. A checkbox vai ser referente a nossa nova coluna no backend
#### Backend
- Adicionar na tabela **/SYN/COMPLEMENTO_ECF** uma coluna referente ao novo checkbox presente em tela. 
- Alterar a verificação do codQualifPJ para verificarmos se o valor referente ao checkbox.
- Refatorar a parte das alíquotas para financeiras, para ficar com uma nomenclatura mais genérica como: findAliquotaCsll -> `ParametrosEcfServiceImpl`
> Refatorar toda as parte que utilizam a tabela da **/SYN/ECF_ALIQUOTA_CSLL_FINANCEIRA** para uma nomeclatura mais generica Stack de ParametrosEcf 
#### Automação 
- Fazer refatoração semelhante ao backend renomeando a parte financeira por algo mais generico e também alterar logica para olhar para verificar a nova coluna.
> Caminho: **src > syn4tdf_automacao > ecf > tbu > core.clj**

> Como quem gera o arquivo é o TDF, então apesar de alterarmos a alíquota, no documento vai sair de acordo com o código e não de acordo com nossas aliquotas informadas.
---
### Atenção
- Verificar se o ID de **/SYN/ECF_ALIQUOTA_CSLL_FINANCEIRA** é usado em algum momento
- Verificar se tem a possiblidade de o metodo **aliquotaCsll** presente nos arquivos `ApuracaoEcfServiceImpl` e `CalculoApuracaoServiceImpl`  seja acesso de um unico local
- Para as empresas financeiras que ja fazem uso da aliquota especifica devemos marcar a coluna como SIM 
### Impacto
1. **automacao**
	- Apuração balancete/diferido 
2. **syn4tdf**
	- Apuração balancete 
	- Apuração diferido
	- Geração do Bloco U (U182)
	- Geração do Bloco N (N660 e N670)
	- Geração do Bloco P (P500)
	- Apuração Imunes e Isentas
	- Apuração Receita Bruta
	- Apuração Lucro da Exploração