#!/bin/bash

permisos_suid() {


echo "Buscando binarios con bit setuid..."
echo "=================================="

result=$(find / -perm -4000 2>/dev/null)

echo "$result" | grep pkexec || grep nmap || grep python

}

permisos_suid

capabilities() {

echo "Buscando binarios con capacidades..."
echo "==================================="

result=$(getcap -r / 2>/dev/null)

echo "$result" | grep python || grep ruby 
 
}

capabilities

