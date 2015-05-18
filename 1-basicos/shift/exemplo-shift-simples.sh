#!/bin/bash
# Use este script passando 6 parâmetros

echo "Lembrete: O Shift serve para rotacionar valores dos parâmetros."
echo "Antes de usar o shift:"
echo "Parâmetro 1: $1"
echo "Parâmetro 2: $2"
echo "Parâmetro 3: $3"
echo "Parâmetro 4: $4"
echo "Parâmetro 5: $5"

echo "Agora vejamos após o uso do shift:"
shift
echo "Parâmetro 1: $1"
echo "Parâmetro 2: $2"
echo "Parâmetro 3: $3"
echo "Parâmetro 4: $4"
echo "Parâmetro 5: $5"
