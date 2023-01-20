#!/bin/bash

# Génération de 100 nombres aléatoires compris entre 1 et 100
for i in {1..10000}
do
  arguments=$(echo $(shuf -i 1-100 -n 100))
  output=$(./push_swap $arguments)
  lines=$(echo "$output" | wc -l)
  if [ $lines -gt 700 ]; then
	echo "            KO $lines $i"
  #else
	#echo "OK $lines"
  fi
done

# Appel du programme "push_swap" avec les 100 nombres aléatoires en argument

