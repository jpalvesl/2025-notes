## Chamado relacionado ao complemento nao encontrado
- ID: 7297d315-65ad-47d5-9473-946c61ac2c1f
- Nome do complemento: **ECF_ATUALIZA_LANCAMENTOS_M410**
- Proposta de solução 1: Importar o complemento anexado

```sql
-- coleta para saber se o complemento realmente nao existe
SELECT * FROM "/SYN/COMPLEMENTO" WHERE NOME = 'ECF_ATUALIZA_LANCAMENTOS_M410';
```

## Conta Parte b nao encontrada
- Ao executar sem o featureToggle habilitado e a conta nao configurada, tivemos o seguinte resultado: **Executado com sucesso**
- Ao executar com o featureToggle desabilitado e a conta nao configurada, tivemos o seguinte resultado: **Executado com sucesso**.
- O erro só acontece quando não temos **Parametros** do calculo automatico para a empresa configurados
- Essa funcionalidade ainda está em beta, então o featureToggle deve ser desabilitado

Pedir o config da instalação