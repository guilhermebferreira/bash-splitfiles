#!/bin/bash

#execute o script passando como parametroo arquivo que pretende ler
#./splitbylines.sh entrada.txt 
#ou delimitar a quantidade de linhas com o segundo argumento
#./splitbylines.sh entrada.txt 5000

x=0	#contador de linhas
f=1
cont=500
prefix='part_'
sufix=''

if [ -z "$2" ]
  then
    echo "No argument supplied"
else
    cont=$2
fi

while IFS='' read -r line || [[ -n "$line" ]]; do

    if [[ "$x" == 0 ]]; then
        echo 'printing file' $prefix$f'_'$1$sufix.txt 
    fi

    echo $line >> $prefix$f'_'$1$sufix.txt 

  	x=$(( x+1 ))

    if [[ "$x" == "$cont" ]]; then
        x=0
        f=$(( f+1 ))
    fi

done < "$1"