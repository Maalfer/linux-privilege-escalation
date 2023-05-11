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

}

clear; tput civis
permisos_suid
capabilities
flagsearch
tput cnorm