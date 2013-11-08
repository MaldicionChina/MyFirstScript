#!/usr/bin/awk -f

BEGIN{
        FS="[:]" # : es el separador
        getline user < "user.regex" # Obtenemos el nombre de usuario
     }
     {
        if(match($1,user) && ($3>=1000)){
        printf $6
        }
     }
END{
close("user.regex") # se cierra el archivo
}
