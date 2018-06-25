#!/bin/bash
###########################################################################################
#  ____  _     ____ ____  ____    _____                     _             _       
# / ___|(_)___| __ ) ___||  _ \  |_   _|__  ___ _ __   ___ | | ___   __ _(_) __ _ 
# \___ \| / __|  _ \___ \| | | |   | |/ _ \/ __| '_ \ / _ \| |/ _ \ / _` | |/ _` |
#  ___) | \__ \ |_) |__) | |_| |   | |  __/ (__| | | | (_) | | (_) | (_| | | (_| |
# |____/|_|___/____/____/|____/    |_|\___|\___|_| |_|\___/|_|\___/ \__, |_|\__,_|
#                                                                   |___/         
#
# Seja bem vindo! 
#
# Autor: Luan Tasca
# Contato: www.sisbsd.com.br
# Telefones: (48) 99155-2183 - (48) 3191-0035
###########################################################################################

apt update
apt install mailutils pwgen -y
apt remove exim4 -y
apt install postfix -y
apt install curl -y
cd /opt/
wget http://install.sisbsd.com.br/senha/senha.sh
cd /root/
wget http://install.sisbsd.com.br/senha/crontab
cat /root/crontab > /etc/crontab
rm -rf /root/crontab
sh /opt/senha.sh
