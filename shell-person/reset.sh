#!/bin/bash


cp ~/.bashrc ~/.bashrc_backup_$(date +"%Y%m%d%H%M%S")

sed -i '/# Configurações personalizadas do PS1/d' ~/.bashrc

echo "export PS1='\[\e[1;37m\]\u@\h \[\e[36m\]\w\[\e[0m\] \$ '" > temp_ps1.sh

echo "Configurações padrão do prompt (PS1) restauradas. Backup salvo em ~/.bashrc_backup_$(date +"%Y%m%d%H%M%S")"

