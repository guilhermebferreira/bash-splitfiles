#!/bin/bash

#execute o script passando como parametroo arquivo que pretende ler
#./splitbylines.sh entrada.txt 

x=1	#contador de linhas
f=1
cont=500



while IFS='' read -r line || [[ -n "$line" ]]; do

     if [[ "$x" == "$cont" ]]; then
        
        echo "finish file $f"
        x=0
        f=$(( f+1 ))
        
    fi

    teste=$?
    echo $line >> output_$f.txt

    #echo "$line" | dd of=test$f.txt

    if [[ "$teste" == 1 ]]; then
        
        echo "Text read from file: $x"
        
        
    fi


   
  	x=$(( x+1 ))
done < "$1"