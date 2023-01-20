
for i in $(seq 1 500)
do
  arguments=$(echo $(shuf -i 1-500 -n $i))
  output=$(./push_swap $arguments)
  lines=$(echo "$output" | wc -l)
  if [ $lines -gt 5500 ]; then
	echo "           KO $lines $i"
  else
	echo "$i : $lines"
  fi
  #echo $arguments
  checker=$(./push_swap $arguments | ./checker $arguments)
  if [ "$checker" != "OK" ]; then
	echo "            NON TRIE $checker $arguments"
  else
    echo "$i $checker"
  fi
done
