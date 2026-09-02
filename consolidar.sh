#!/bin/bash

while true; do
    #if [ "$(ls -A "entrada/")" ]; then
        
        for archivo in EPNro1/entrada/*; do
            if [ -f "$archivo" ]; then
                cat "$archivo" >> EPNro1/salida/FILENAME.txt
                mv "$archivo" EPNro1/procesado/
                echo -e "\t" >> EPNro1/salida/FILENAME.txt
                echo "$(date +%Y/%m/%d\ %H:%M:%S) - Archivo procesado: $(basename "$archivo")" >> EPNro1/procesado.log
            fi
        done
    #fi
    sleep 5
done

