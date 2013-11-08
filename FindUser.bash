#!/bin/bash 

echo "Ingrese su Usuario: "
read user  # se lee el usuario ingresado por consola
echo "$user" > user.regex # se agrega el usuario a un archivo externo para su posterior lectura
cat /etc/passwd > userPath.txt # se almacena la lista de usuarios con acceso al sistema, para luego determinar cuáles son realmente usuarios
pathUser=$(./FindPath.awk userPath.txt) # se ejecuta el script de awk que retornar al ruta del home, en caso de que exista
totalDirectory=$(ls -l $pathUser | grep ^d -c) 
totalHideDirectory=$(($(ls -la $pathUser | grep ^d -c)-$totalDirectory-2)) #al total de directorios se le resta los no ocultos y los 2 comodines punto y punto punto 
totalShowFiles=$(ls -l $pathUser | grep ^- -c)
totalHideFiles=$(($(ls -la $pathUser | grep ^- -c)-$totalShowFiles))  
echo "-------Ruta: " $pathUser
echo "-------N° Carpetas: " $totalDirectory
echo "-------N° Carpetas ocultas: " $totalHideDirectory
echo "-------N° Archivos: " $totalShowFiles
echo "-------N° Archivos ocultos: " $totalHideFiles

rm -r user*.* # se borran los archivos creados
