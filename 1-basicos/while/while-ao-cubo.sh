#!/bin/bash

n=0
while (( n < 10 ))
do
	(( cubo = n * n * n ))
	echo "O número $n ao cubo é $cubo!"
	(( n = n + 1 ))
done
