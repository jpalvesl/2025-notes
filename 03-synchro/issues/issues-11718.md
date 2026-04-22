
> [!NOTE] # [ECF] - Habilitar possibilidade de selecionar mais de 200 lançamentos na parâmetrização


Com a criação da parametrização da apuração da ECF habilitamos a possibilidade de selecionar lançamentos contábeis, porem o Synchro4TDF limita a exibição e associação em 200, porem haverá cenários (muitos) que será necessário mais de 200 lançamentos para compor o esperado, desta forma será necessário evoluir para comportar a inserção de mais de 200 lançamentos contábeis.

## **Geral**
- Vamos precisar de dois endpoints. O que temos agora, e o que deve pegar os filtros e executar um processo assíncrono (O volume de dados não deve parar a utilização do sistema)

## Sugestão 1
### Quando o botão de selectAll estiver selecionado mostrar modal para levar em consideração os filtros para associar todos os valores e não apenas os 200 em tela
#### Prós 
- Não seria adicionado mais nenhum elemento em tela
- O usuário poderia adicionar tanto os lançamentos dos filtros quanto os lançamentos selecionados
#### Contras
- Mais uma ação para o usuário fazer
- Nenhum indicativo que é possível executar a associação utilizando os filtros

## Sugestão 2
### Adicionar botão em tela para exibir que os filtros vão ser levados em consideração e não os valores selecionados
#### Prós
- O usuário veria que é possível fazer a associação utilizando apenas os filtros, já que o botão (switch, checkbox ou Radio Button) estaria em tela desde o inicio
- Não vai ter atrito no momento de confirmar a associação
#### Contras
- Não temos nenhuma tela com esse comportamento atualmente
- Tratar os campos em tela quando selecionar a opção de associar via filtro
### Botão
#### Onde ele deve estar?
- [ ] Ao lado do Atualizar
- [ ] Ao lado das opções de filtro?
- [ ] No Resumo dos Lançamentos selecionados?
#### Qual botão devemos utilizar?
- [ ] Switch
- [ ] Checkbox

### Como os componentes em tela devem se comportar?
- [ ] Seleção de lançamentos -> **Sempre estar selecionados depois de ativar a opção por filtro**
- [ ] Resumo dos lançamentos -> **Não demonstrar lançamentos selecionados. Demonstrar uma mensagem que os valores usados serão  usando o filtro da tela**
### Melhoria
- [ ] Remover filtros de Conta Contábil e centro de custo quando eles forem passados via queryParams (Evita que o usuário cadastre lancamentos de outras contas ou centros de custo)

## Sugestão 3
### Abrir um modal perguntando se vai se que utilizar os filtros no lugar dos registros escolhidos
#### Prós
- [ ] Possibilidade de associar os registros dos filtros, ou registros selecionados

#### Contras
- [ ] Um passo a mais pra o usuário
- [ ] Nenhum indicativo que é possível executar a associação utilizando os filtros

--- 
## Obs
- Adicionar um tour explicando a funcionalidade
- Se for por filtro e tiver valor selecionados abrir um modal de confirmação indicando que os valores nao serao levados e apos isso abrir o modal com os filtros para o processo
- Botão depois do atualizar, colocar hint no botão