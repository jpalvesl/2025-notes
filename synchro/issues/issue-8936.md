---
tags:
  - frontend
  - backend
  - automacao
started_at: 
done: true
---

> [!NOTE] # [3321898] Revisão regra ISS_CRITICAS

- Item 1: CRITICAS_DT_E_S_X_DT_DOC
	- Só deve ser exibida pra quem utilizar as ==Executar as criticas apenas via tela de apuração e nao pela tela de **Execução e Status de processos**==
	- **Origem**: sap.glo.tmflocbr.ctr/NF_DOCUMENTO_ITEM_IMPOSTO
	- **Destino**: /SYN/ITG/CRITICA
- Item 2: CRITICAS_COD_ITEM_X_TRIBUTACAO
	- Para essa crítica precisamos evoluir o complemento para ==considerar a nova tabela: /SYN/NF_DOC_ITEM_TRIBUTACAO_ISS"==
	- **Origem**: suporte.br.com.synchro.corporativo/V_RELATORIO_DOC_ITEM_SERVICO
	- **Destino**: /SYN/ITG/CRITICA
- Novo Regra: ==NOME?===, **Realmente vai ser uma nova regra?**
	- Para as execuções ISSQN OU ISSQN2. evoluir para críticar os documentos em atraso
## Pontos abordados na issue
- [x] Criar CV especifica para as criticas e unificar
- [x] Unificar os dois itens na mesma CV
- [x] Adicionar nos workflows da automação a etapa de execução das criticas
	- [x] municipais/commands ==Temos que executar alguma critica ao executar por esse local?==
	- [x] municipais/apuracao/commands ==Adicionar novo comando para executar as criticas especificas se for ISS ou ISSQN==
- [ ] Fazer Criticas para o ISSQN
	- [x] O primeiro item é só pra ISS
	- [ ] O terceiro é só pra ISSQN
		- V_DOCUMENTO_ITEM_PARTICIPANTE_ISS
		- Verificar se faz sentido replicar a logica de nota de corte,  ou utilizar direto essa CV como fonte no lugar de NF_DOCUMENTO_ITEM_IMPOSTO
	- [x] Fazer 3 Complementos
		- [x] `ISS_<NOME>_GERAL`
		- [x] `ISSQN_CRITICAS`
		- [x] `ISS_CRITICAS`

--- 
## Complemento de criticas customizado da Gerdau ==Verificar o impacto nesse complemento quando separamos as regras==
### PSYN_ISS_CRITICAS_GERDAU
#### Item : **CRITICAS_COD_ITEM_X_TRIBUTACAO**
- **Origem**: br.com.synchro.corporativo/V_RELATORIO_DOC_ITEM_SERVICO
- **Destino**: /SYN/ITG/CRITICA

#### Filtros
**MODELO** _é diferente de_ "05"
**TRIBUTACAO_COD_LEI** _é vazio_


> [!question] Podemos pedir pra o usuario adicionar esse complemento na raia do ISS? Ou ele tambem deve ser executado pra ISSQN?
> Acredito que seja nos dois, porque a regra está presente na mesma critica que é geral **Item 2**
> 
> Como nao vai ser mais usado entao não precisa alterar



---
# Análise

## Apuracao ISS e Apuracao ISSQN **Executar apuração**
> ComplementoIssResource -> ApuracaoIssProcess
> ComplementoIssqnResource -> ApuracaoIssProcess
```
params = {
	filial: 0001
	periodo: 202502
	empresa: 1000
	mandt: 100
	codigoLogin: syn4tdf.demo@synchro.com.br
	etapa: null
	codIbge: null
}
```
Pacote utilizado **APURACAO_ISS**

## Apuracao ISSQN_2.0 **Apurar**
>  ComplementoApuracaoIssResource -> ApuracaoIssProcess
```
params = {
	filial: 0001
	periodo: 202502
	empresa: 1000
	mandt: 100
	codigoLogin: syn4tdf.demo@synchro.com.br
	etapa: APURACAO_ISS
	codIbge: 3509502
	apuracao-version: "2"
}
```
Pacote utilizado **APURACAO_ISS_2.0**


## Apuracao ISSQN_2.0 **Apuração complementar**
>  ComplementoApuracaoIssResource -> ApuracaoIssProcess
```
params = {
	filial: 0001
	periodo: 202502
	empresa: 1000
	mandt: 100
	codigoLogin: syn4tdf.demo@synchro.com.br
	etapa: APURACAO_ISS_COMPLEMENTAR
	codIbge: 3509502
	apuracao-version: "2"
}
```
Pacote utilizado **APURACAO_ISS_2.0_COMPLEMENTAR**

**APURACAO_ISS_2.0_FAT**: Executado apenas quando é Recife ou Vitória


### Diagrama da apuração ISS/ISSQN
![[../excalidraw/8936.excalidraw]]
- [x] Devemos criar uma raia para ISSQN para assim podermos colocar os complementos especificos daquela raia
- [x] Separar os complementos itens em complementos
- [x] Cria novo complemento de critica para documentos em atraso (ISSQN)
- [ ] Adicionar no back se é issqn ou iss
- [ ] Verificar se for issqn executar o proprio pacote no  lugar do iss


---
## Como os campos da critica são montados
### CRITICAS_DT_E_S_X_DT_DOC
- [x] ID: `{SEQ_CRITICA.nextval}`
- [x] CREATED: `{CURRENT_TIMESTAMP}`
- [x] EMPRESA: **EMPRESA**
- [x] FILIAL: **FILIAL**
- [x] IDENTIFICADOR_FUNCIONAL: **NF_ID**
- [x] ID_REGISTRO_ENTIDADE: `{''|| MANDT ||'(+)'|| DT_E_S ||'(+)'|| FILIAL ||'(+)'|| EMPRESA ||'(+)'|| NF_ID ||''}`
- [x] MANDT: **MANDT**
- [x] MENSAGEM: `{'NF_ID: ' ||NF_ID || ' , DT_E_S: ' || DT_E_S || ' e DT_DOC: ' || DT_DOC ||' , COD_SIT: ' || COD_SIT || ' , COD_MOD: ' || COD_MOD ||' Nota fiscal Data de entrada maior que emissao'}`
- [x] MODULO: `MUNICIPAIS`
- [x] NOME_ENTIDADE: `documentos-fiscais-servicos`
- [x] PERIODO: `{SUBSTR(DT_E_S,1,6)}`
- [x] SEVERIDADE: `ALERTA`
- [x] TITULO: `Data do fato gerador maior que Data de Emissão`

### CRITICAS_COD_ITEM_X_TRIBUTACAO
- [x] ID: `{SEQ_CRITICA.nextval}`
- [x] CREATED: `{CURRENT_TIMESTAMP}`
- [x] EMPRESA: **EMPRESA**
- [x] FILIAL: **FILIAL**
- [x] IDENTIFICADOR_FUNCIONAL: `ID` ==NF_ID==
- [x] ID_REGISTRO_ENTIDADE: `{''|| MANDT ||'(+)'|| DT_FATO_GERADOR ||'(+)'|| FILIAL ||'(+)'|| EMPRESA ||'(+)'|| ID ||''}`
- [x] MANDT: **MANDT**
- [x] MENSAGEM: `{'ID: ' ||ID || ' , DT_EMISSAO: ' || DT_EMISSAO || ' e DT_FATO_GERADOR: ' || DT_FATO_GERADOR ||' , COD_SIT: ' || COD_SIT || ' , COD_ITEM: ' || COD_ITEM ||' Código do Item não cadastrado na Tributação ISS'}`
- [x] MODULO: `MUNICIPAIS`
- [x] NOME_ENTIDADE: `documentos-fiscais-servicos`
- [x] PERIODO: `{SUBSTR(DT_FATO_GERADOR,1,6)}`
- [x] SEVERIDADE: `ALERTA`
- [x] TITULO: `Código do Item não cadastrado na Tributação ISS`
---