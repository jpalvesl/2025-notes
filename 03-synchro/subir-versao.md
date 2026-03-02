# Subir versao
## Passos
1. Fazer o pull da branch pra pegar tudo que está no remoto (master ou -suporte)
2. Altera a branch para a atualiza-versao-evolucao
3. Alterar version em `build.gradle` do modulo syn4tdf commit
4. Abre e aceita seu proprio MR (master ou -suporte)
5. Rodar o pipeline release_version

6. Ir para as branchs atuais ->  automacao, contab e syn4tdf
7. Ir pra a branch **update-cvs** do dev-tools
8. Depois de atualizar as releases escolher o app e disparar
	- Quando a gente atualiza dev atraves do cockpit o banco não é atualizado
9. Mandar mensagem no grupo quando inciar o processo de atualização do ambiente dev-...
10. Atualizar branch do ATC  e do automação para master e fazer o pull
11. Executar `db:update`
	- Fazer rollback e reaplicar liquibase quando der erro
12.  Caso tenha mais alguma build na frente do gateway disparar o processo pra atualizar os apps
	- gateway
	- atc
	- automacao
	- crud-generico
	- motor
	- report
13. A atualizacao do syn4tdf só depois de atualizar as CVs e as Procs `db:update`
14. Importar os complementos **SYN4TDF** e **ATC**
15. Os complementos que nao ativarem precisamos ver se está versionado no produto para poder mandar a mensagem que nao foi ativado