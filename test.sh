#! /bin/bash

archivo=indice.txt
# cmd cat extraigo texto del archivo
indice=$( cat "$archivo" )
echo "el ultimo video reproducido es: $indice"

fecha=$(date)
mes=$( date +%m )
anio=$( date +%Y )
echo $mes
echo $anio
mkdir "${anio}_${mes} apple"
echo "Cuantos años tienes"
read edad


if (( edad >= 40 ))
then
	salida="$fecha Menudo carroza, -> $edad\n"
	echo $salida
else
	salida="$fecha Ya llegaras, -> $edad\n"
	# opc -e para leer el salto de line /n
	echo -e $salida
fi

echo $salida >> salida.txt

#automatiza la apertura de varias urls
urls=(
	"https://www.youtube.com/watch?v=YbVLeegKIOs&list=PLG1qdjD__qH4dyXq4sM03Rf0RFhB_4tbm&index=38"
    "https://www.idealista.com/venta-viviendas/arroyomolinos-madrid/con-precio-hasta_240000/?ordenado-por=precios-asc"
    "https://www.idealista.com/venta-viviendas/moraleja-de-enmedio-madrid/con-precio-hasta_240000/?ordenado-por=precios-asc"
    "https://www.idealista.com/venta-viviendas/mostoles/sur/con-precio-hasta_220000,garaje/"
	"https://www.idealista.com/geo/venta-viviendas/parque-coimbra/con-precio-hasta_240000,garaje/"
	"https://www.idealista.com/venta-viviendas/fuenlabrada/loranca/con-precio-hasta_240000,garaje/"
)


for (( i=0; i<${#urls[@]}; i++ )); do
    open -a Safari "${urls[$i]}"
done

open -t salida.txt
sleep 10
pkill TextEdit

# para interactuar con appleScript cmd osascript y traigo a primer plano
osascript -e 'tell application "Terminal" to activate' 
echo "Dime el ultimo video reproducido"
read ultimo

echo $ultimo > indice.txt

open -a Mail
open -a Udemy

function estoEsUnaFuncion() {
	echo "parametro 1 = $1 y parametro 2 = $2"
}
# Definir un array
frutas=( "manzana" "banana" "naranja" )
numeros=( 45 67 98 )
# Iterar sobre los índices del array
for (( i=0; i<${#frutas[@]}; i++ )); do
    estoEsUnaFuncion ${frutas[$i]} ${numeros[$i]}
done

echo "para hacer peticiones http cmd curl ej. un json"
url="https://jsonplaceholder.typicode.com/users"
curl $url
# almacenarlo en variable
# respuesta=$( curl -s $url )












