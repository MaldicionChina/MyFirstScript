#!/usr/bin/awk -f
# retorna la ruta del home si el usuario se encuentra , retorna 'Not_Found' si el usuario no es encontrado
BEGIN{
        FS="[:]" # : es el separador
        getline user < "user.regex" # Obtenemos el nombre de usuario
        cambio = "Not_Found"
     }
     {
        if(match($1,user) && ($3>=1000)){
        printf $6
        cambio = "Found"
        }
     }
END{
if(match(cambio,"Not_Found"))
{
        print cambio
}
close("user.regex") # se cierra el archivo
}
