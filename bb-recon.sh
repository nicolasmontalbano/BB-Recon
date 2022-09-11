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
cat $1/alive.txt | aquatone -out /$1/
#Organizamos archivos
mkdir aquatone_$1
mv aquatone_report.html aquatone_session.json aquatone_urls.txt headers html screenshots aquatone_$1
mv aquatone_$1 $1/


