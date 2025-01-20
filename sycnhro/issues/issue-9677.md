> [!NOTE] # [Chamado: 3309435] [ECF] - [Besni] Continuação do chamado 3237153

> Para definir as alíquotas especificas para cada período a **Qualificação da Pessoa Jurídica** deve ser 02 - PJ Componente do Sistema Financeiro.

## Definições técnicas
- Fazer com que seja possível definir as alíquotas para cada período para todas as **Qualificações**
- Isso é necessário pois a alíquota é liberada no meio do ano, mas o manual é só no fim do ano, então o cliente precisa mudar a alíquota no meio do ano, sem termos que adicionar novos metadados pra isso de forma paliativa

## Análise técnica
- [ ] **CV**: V_PARAMETROS_ALIQUOTAS_ECF
	- [ ] V_CONFIGURA_VALORES_AUTOMATICOS (**Transforma a ALIQ_CSLL em um Valor numérico**)
		- [x] V_CONFIGURA_VALORES_PARTE_B (**Não passa pra frente a ALIQ_CSLL**)
		- [ ] ECF_VALORES_INCENTIVOS_CONFIG (**Não utiliza o ALIQ_CSLL**)
	- IND_ALIQ_CSLL no backend
		- [ ] ApuracaoEcfServiceImpl
		- [ ] CalculoApuracaoServiceImpl
		- [ ] ParametrosEcfRepositoryImpl (**Insert e update do questionario**)
	- [ ] V_PARAMETROS_ECF
---
## Sugestões
### 1
- Adicionar em alguma tabela um indicador que as ALIQ_CSLL serão alteradas
- Refatorar a parte das alíquotas para financeiras, para ficar com uma nomenclatura mais genérica
