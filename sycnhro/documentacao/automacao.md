# Automação
%% 
Existe alguma coisa que que ainda não foi migrada mas está no radar? **ECF foi migrada parcialmente** 

A automação tem o conhecimento do que  fazer e quando fazer chamamos isso de workflows, porém desconhece, como quando e por quem vai ser feito

Atraves do trace podemos temos bastante informação visto que salvamos o dado na sua forma bruta

Tela -> Admin > Status das automações

---
 %%
> [!NOTE] # Automação

![[../excalidraw/automacao-abstrata.excalidraw]]

A Automação é um componente do sistema que possui as seguintes características:
- Arquitetura orientada a eventos
- Processos declarativo (**Workflows**)
- Visão unificada e rastreável dos workflows através do Message Store
- Funciona como uma fila que executa os comandos que são adicionados

Criado inicialmente com a finalidade mover a geração de obrigação do java, para melhorar tanto a manutenção do código quando a escalabilidade do sistema, a automação é um modulo que tem como finalidade orquestrar as integrações do SYNCHRO4TDF (Motor de complemento, validação no PVA, transmissão para o AE).
Foi criado de uma forma que podemos escolher quantas integrações podem rodar em paralelo (x no motor de complemento, y no reports, z no AE) e através da nossa visão unificada podemos identificar com facilidade em qual local está o gargalo do processo para podermos lidar com isso da melhor forma, como citado acima.

## Comandos e eventos
### Evento
Evento é uma mensagem de notificação sobre um acontecimento

### Comando
É uma mensagem de solicitação para execução de uma tarefa.

### Workflow
![workflow](../../attachments/Pasted%20image%2020250306143143.png)
%% 
---

Temos 3 tabelas
- /SYN/MESSAGE_STORE
- /SYN/MESSAGE_STORE_SUBSCRIBER_CONTROL
- /SYN/MESSAGE_STORE_SUBSCRIBER_REGISTER

**MESSAGE_STORE**: Diz respeito ao message store em si, que utilizamos pra armazenar comandos e eventos

**CONTROL**: read-messages -> Controla e registra de comando e evento

**REGISTER**: read-subscriber-registers -> Não tem uso na mecanica do message store, usada apenas pra trobleshooting










---
### Reuniao
- Projection processa os eventos e adiciona logs

- **gerproc/on-event!** : são processos distribuidos (iniciados no syn4)
- As primeiras funcionalidades feitas na autmação não utilizavam o gerproc e por isso tinham sua propria tabela que precisa ser atualizada

- Verificar se podemos iniciar um processo atraves do gerproc ou só podemos dar continuidade a um processo ja agendado

- Auditoria tambem cadastra no messagem store %%

Alta latencia e baixa frequenciao banco só consegue rodar poucas coisas por vez (O motor por exemplo o padrao é ter 2 threads apenas)

events source 