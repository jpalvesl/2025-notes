
> [!NOTE] # [3321898] Revisão regra ISS_CRITICAS

- Item 1: CRITICAS_DT_E_S_X_DT_DOC
	- Só deve ser exibida pra quem utilizar as ==opções do menu== -> **Seria necessario separar esse item em outro complemento?**
	- **Origem**: sap.glo.tmflocbr.ctr/NF_DOCUMENTO_ITEM_IMPOSTO
	- **Destino**: /SYN/ITG/CRITICA
- Item 2: CRITICAS_COD_ITEM_X_TRIBUTACAO
	- Para essa crítica precisamos evoluir o complemento para ==considerar a nova tabela: /SYN/NF_DOC_ITEM_TRIBUTACAO_ISS"== -> *Aparentemente ja está feito na Projection_29*
	- **Origem**: suporte.br.com.synchro.corporativo/V_RELATORIO_DOC_ITEM_SERVICO
	- **Destino**: /SYN/ITG/CRITICA
- Novo Regra: ==NOME?===, **Realmente vai ser uma nova regra?**
	- Para as execuções ISSQN OU ISSQN2. evoluir para crítica os documentos em atraso -> Adicionar tambem no pacote
	- Esse complemento esta nos pacotes **APURACAO_ISS** e **APURACAO_ISS_2.0**

--- 
## Complemento de criticas customizado da Gerdau
### PSYN_ISS_CRITICAS_GERDAU
#### Item : **CRITICAS_COD_ITEM_X_TRIBUTACAO**
- **Origem**: br.com.synchro.corporativo/V_RELATORIO_DOC_ITEM_SERVICO
- **Destino**: /SYN/ITG/CRITICA
---
### Observações
- Verificar possiblidade de criar uma CV especifica pra critica
- ISSQN e ISSQN2: Ficaria no lugar do primeiro item, mas o item2 seria igual
- Atualmente pra gerar uma obrigação a gente executa a raia de apuracao_ISS ou apuracao_ISS_2.0, sendo assim todas as criticas seriam exibidas, visto que a gente nao tem nenhuma forma de saber qual critica mostrar.

- No futuro o que tende a acontecer eh o ISSQN morrer e ficar apenas a 2.0

---
### Fazendo CV especifica
#### Campos usados na critica
1. MANDT
2. EMPRESA
3. FILIAL
4. ID (NF_ID)
5. DT_FATO_GERADOR (DT_E_S)
6. DT_EMISSAO  (DT_DOC)
7. COD_SIT
8. COD_ITEM
9. COD_SERV_SYNCHRO4TDF

COD_SERV -> COD_ITEM

---
# Desenvolvimento
- [x] Criação de CVs especificas para a critica
- [x] Adição do NF_DOC_ITEM_TRIBUTACAO_ISS no segundo item da critica
- [ ] Levantar sugestões para lidar com o primeiro e terceiro item da issue.
	- Atualmente a critica só atendo o ISS e ISS_2.0, mas é executada sempre.


## Apuracao ISS e Apuracao ISSQN
> ComplementosIssResource -> ApuracaoIssProcess
> ComplementosIssqnResource -> ApuracaoIssProcess
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


## Apuracao ISSQN_2.0 **Apurar**
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


-> Nao encontrei ainda como esse pacote é usado **APURACAO_ISS_2.0_FAT**


---
- [ ] Colocar em uma CV só as criticas
- [ ] alterar workflow do fluxo de apuração
- [ ] Alterar CV pra verificar se o valor de ambas projections vem nulas