#!/bin/bash

permisos_suid() {


echo "Buscando binarios con bit setuid..."
echo "=================================="

result=$(find / -perm -4000 2>/dev/null)

echo "$result" | grep pkexec || grep nmap || grep python

}

permisos_suid
