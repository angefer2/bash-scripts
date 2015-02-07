#!/bin/bash
echo "Escolha seu time: "
echo "1 - Atlético PR"
echo "2 -  Coritiba"
echo "3 - Paraná"
read futebol

case $futebol in 
1) echo "O Atlético é muito bom!";;
2) echo "O Coritiba é meh";;
3) echo "O Paraná está na segunda divisão";;
*) echo "você não entendeu a brincadeira";;
esac
