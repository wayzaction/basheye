#!/bin/bash

while true
do
clear


###############################################

# Colors

magenta='tput setaf 5'
cyan='tput setaf 6'
reset='tput sgr0'

# Distribution

echo -n "${cyan}${magenta} "
cat /etc/*-release | grep "PRETTY_NAME=" | cut -f2 -d "="  

# User and Hostname

echo "${cyan}  $(whoami)${reset}@${magenta}$(hostname)"

# Kernel

echo "${cyan}󰇺  ${magenta}${reset}Kernel:${reset} $(uname -r)"

# CPU 

echo -n "${cyan} ${reset} Processor:" 
cat /proc/cpuinfo | grep 'model name' | cut -f2 -d ":" | head -1

# GPU 

echo -n "${cyan}󱤓 ${reset} Videocard: "

lspci | grep -i 'vga\|3d\|2d' | cut -f3 -d "["

# MEM 

echo -n "${cyan}󱡋${reset}  Memory: "
cat /proc/meminfo | grep -F MemTotal: | grep -o '[0-9]*' | awk '{$1=$1/(1024^2); print $1,"GB";}'


###############################################


sleep 2
done
