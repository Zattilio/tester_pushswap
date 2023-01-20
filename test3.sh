#!/bin/bash

# Boucle sur les combinaisons de nombres de 1 à 5 sans répétition
for i in `seq 1 3`; do
  for j in `seq 1 3`; do
    if [ $i -ne $j ]; then
      for k in `seq 1 3`; do
        if [ $k -ne $i ] && [ $k -ne $j ]; then
                  # Appel du programme push_swap avec les nombres en argument
                  output=$(./push_swap $i $j $k)
				  checker=$(./push_swap $i $j $k | ./checker $i $j $k)
                  # Compte le nombre de lignes de la sortie
                  lines=$(echo "$output" | wc -l)
                  # Si le nombre de lignes est supérieur à 12, affiche "KO" et les arguments
                  if [ $lines -gt 3 ]; then
                    #echo "$i $j $k $l $m   TROP D ETAPES $"
				  #else
				  	echo "                        $checker $i $j $k TROP D ETAPES"
                  fi
				  if [ "$checker" != "OK" ]; then
					echo "KO $i $j $k"
				  else
				  	echo "OK $i $j $k"
				  fi
        fi
      done
    fi
  done
done
