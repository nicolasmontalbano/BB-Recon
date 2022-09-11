#!/bin/bash
echo "Ingresa el dominio: "
#Buscamos subdominios con subfinder
subfinder -d $1 | tee domains.txt
#Creamos carpeta del dominio
mkdir $1
#Movemos el archivo de subdominios a su carpeta
mv domains.txt $1/
#Buscamos dominios vivos
cat $1/domains.txt | httprobe | tee $1/alive.txt
#Aquatone
cat $1/alive.txt | ./home/kali/Scripts/Recon/aquatone -out /$1/