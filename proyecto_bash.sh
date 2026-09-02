#!/bin/bash

echo "-----Menu-----"
echo "opción 1) Crear entorno."
echo "opción 2) Correr proceso."
echo "opción 3) mostrar listado de alumnos ordenados por número de padrón."
echo "opción 4) mostrar por pantalla las 10 notas más altas del listado."
echo "opción 5) mostrar datos por numero de padrón ingresado."
echo "opción 6) Visualizar log."
echo "opción 7) Salir"
echo "opcion -d) borra entorno creado en EPNro1 y se matarán los procesos en background."
echo "--------------"
echo "Ingrese una opción: "
read opcion

case $opcion in
    1)
        echo "Creando entorno..."
        mkdir EPNro1
        cp consolidar.sh EPNro1/
        cd EPNro1
        mkdir entrada salida procesado
        touch salida/FILENAME.txt procesado.log
        cd ..
        echo "Entorno creado."
        echo
        ;;
    2)  
        echo "Correr proceso..."
        bash EPNro1/consolidar.sh &
        echo "Proceso corriendo."
        echo
        ;;
    3)
        echo "Lista de alumnos ordenados por padron:"
        sort -t, -k1 EPNro1/salida/FILENAME.txt
        echo
        ;;
    4)
        echo "10 notas mas altas:"
        sort -k5 -nr EPNro1/salida/FILENAME.txt | head -n 10
        echo
        ;;
    5)
        echo "Ingrese el número de padrón del alumno:"
        read padron
        grep "$padron" EPNro1/salida/FILENAME.txt
        echo
        ;;
    6)
        echo "Visualizando procesado.log"
        cat EPNro1/procesado.log
        echo
        ;;
    7)
        echo "Saliendo..."
        exit 0
        ;;
    -d)
        echo "Borrando entorno y procesos..."
        rm -rf EPNro1
        pkill -f -9 consolidar.sh
        echo
        ;;
esac
echo
exit 0
