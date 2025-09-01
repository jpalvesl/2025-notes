#!/usr/bin/env bash

# Indica que qualquer comando imediato ou subsequente que falhar, irá abortar a execução do script imediatamente
set -e

# Substitui conteúdo em todos os XML das calc. views baseado na opção escolhida (DEV/MASTER, MASTER/QA, ...)
while [ "$renameOption" != 1 -a "$renameOption" != 2 -a "$renameOption" != 3 -a "$renameOption" != 4 -a "$renameOption" != 5 ]; do
    printf "
Escolha a opção de rename
 1 - SUPORTE para MASTER
 2 - MASTER para SUPORTE
 3 - ZIP para deploy
 4 - EVOLUCAO para MASTER
 5 - MASTER para EVOLUCAO
? "
    read renameOption
done

case $renameOption in
    1) printf "\nOpção escolhida: SUPORTE para MASTER" ;;
    2) printf "\nOpção escolhida: MASTER para SUPORTE" ;;
    3) printf "\nOpção escolhida: ZIP para deploy" ;;
    4) printf "\nOpção escolhida:  EVOLUCAO para MASTER";;
    5) printf "\nOpção escolhida:  MASTER para EVOLUCAO";;

esac
#
printf "\n\nConfirma escolha da opção? [s/n]: "
    read confirma

if [ "$confirma" != "s" -a "$confirma" != "S" ]; then
    printf "Operação cancelada!"
    exit 1
fi
#
mv HDQ/ CV/ ;
cd CV/
#
case $renameOption in
    1)
        mv suporte/br/ .
        rm -rf suporte/
        find . -type f | xargs perl -pi -e 's/SYN4TDF_SUPORTE/SYN4TDF/g'
        find . -type f | xargs perl -pi -e 's/suporte.br.com.synchro/br.com.synchro/g'
        ;;


    2)
        mkdir suporte
        mv  br/ suporte/;
        find . -type f | xargs perl -pi -e 's/SYN4TDF/SYN4TDF_SUPORTE/g' ;
        find . -type f | xargs perl -pi -e 's/br.com.synchro/suporte.br.com.synchro/g' ;
        ;;


    4)
        mv evolucao/br/ .
        rm -rf evolucao/
        find . -type f | xargs perl -pi -e 's/SYN4TDF_EVOLUCAO/SYN4TDF/g'
        find . -type f | xargs perl -pi -e 's/evolucao.br.com.synchro/br.com.synchro/g'
        ;;

    5)
        mkdir evolucao
        mv br/ evolucao/
        find . -type f | xargs perl -pi -e 's/SYN4TDF/SYN4TDF_EVOLUCAO/g'
        find . -type f | xargs perl -pi -e 's/br.com.synchro/evolucao.br.com.synchro/g'
        ;;

esac

#
cd ..

# Zipa e move para dentro do projeto quando informado a versao no script (rename.sh <versao>)
if [ "$1" != "" ]; then
    # ZIP CV
	zip -r -q CV_$1.zip CV
	mv ./CV_$1.zip /dados/workspace/syn4tdf/backup/developer-mode
fi

# Execução terminou com sucesso! \o/
cat << "EOF"
               _
              /(|
            __\  \  _____
          (____)  `|
         (____)|   |
          (____).__|
           (___)__.|_____
EOF
exit 0
