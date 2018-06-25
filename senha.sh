#!/bin/bash

# Gera dois numeros randomicos
senha_suporte=`/usr/bin/pwgen -nB 7 1`
senha_root=`/usr/bin/pwgen -nB 7 1`
name=`/usr/bin/pwgen -nB 7 1`
hostname=`cat /etc/postfix/main.cf |grep "myhostname = " |awk {'print $3'}`
porta_ssh=`cat /etc/ssh/sshd_config |grep "Port " |awk {'print $2'}`
ip=`curl eth0.me`

(echo $senha_suporte ; echo $senha_suporte ) | passwd suporte 
(echo $senha_root ; echo $senha_root ) | passwd root

echo "Servidor: $hostname" > /tmp/senha.$name
echo "" >> /tmp/senha.$name
echo "Senha do Usuario Suporte: $senha_suporte" >> /tmp/senha.$name
echo "Senha do Usuario Root: $senha_root" >> /tmp/senha.$name
echo "" >> /tmp/senha.$name
echo "IP do Servidor: $ip" >> /tmp/senha.$name
echo "Porta SSH: $porta_ssh" >> /tmp/senha.$name
echo "" >> /tmp/senha.$name
echo "SisBSD Tecnologia" >> /tmp/senha.$name
echo "www.sisbsd.com.br" >> /tmp/senha.$name

# Manda email
mail -s "Senha Servidor - $hostname" senhas@sisbsd.com.br < /tmp/senha.$name
rm -rf /tmp/senha.$name

echo ""
echo "Senha Alterada"
echo ""
