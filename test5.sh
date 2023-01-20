#!/bin/bash

# Boucle sur les combinaisons de nombres de 1 à 5 sans répétition
for i in `seq 1 5`; do
  for j in `seq 1 5`; do
    if [ $i -ne $j ]; then
      for k in `seq 1 5`; do
        if [ $k -ne $i ] && [ $k -ne $j ]; then
          for l in `seq 1 5`; do
            if [ $l -ne $i ] && [ $l -ne $j ] && [ $l -ne $k ]; then
              for m in `seq 1 5`; do
                if [ $m -ne $i ] && [ $m -ne $j ] && [ $m -ne $k ] && [ $m -ne $l ]; then
                  # Appel du programme push_swap avec les nombres en argument
                  output=$(./push_swap $i $j $k $l $m)
				  checker=$(./push_swap $i $j $k $l $m | ./checker $i $j $k $l $m)
                  # Compte le nombre de lignes de la sortie
                  lines=$(echo "$output" | wc -l)
                  # Si le nombre de lignes est supérieur à 12, affiche "KO" et les arguments
                  if [ $lines -gt 12 ]; then
                    echo "                  $i $j $k $l $m   TROP D ETAPES $"
                  fi
				  if [ "$checker" != "OK" ]; then
					echo "        KO $i $j $k $l $m $checker"
				  else
					echo "OK $i $j $k $l $m"
				  fi
                fi
              done
            fi
          done
        fi
      done
    fi
  done
done
