# Declan
- O erro está acontecendo ao executar o item **REGISTRO_TIPO_0300**
- Existe uma uniao com 17 fontes, sendo 15 dessas fontes NF_DOCUMENTO_ITEM_IMPOSTO
- Do jeito que está agora pode ser que um registro da NF_DOCUMENTO_ITEM_IMPOSTO seja projetado em mais de uma das 15 fontes
- Esse problema `cannot allocate enough memory` acontece na CV certo? Acredito que sim, podemos quebrar as CVs que temos na união em regras do item citado acima.
