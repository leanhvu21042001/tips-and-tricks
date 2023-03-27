#!/bin/bash

echo "Enter your email: "; read email;
echo "Enter your username: "; read username;

ssh-keygen -t rsa -C "$email" -f "id_rsa_$email";

touch config
echo >> config;
echo >> config;
echo "# Gitlab $username" >> config
echo "Host gitlab.com-$username" >> config
echo "HostName gitlab.com" >> config
echo "PreferredAuthentications publickey" >> config
echo "IdentityFile ~/.ssh/id_rsa_$email" >> config

eval "$(ssh-agent -s)"
ssh-add -D
ssh-add ~/.ssh/id_rsa_$email
ssh-add -l

echo;
echo "SSH Key:"
echo;
cat ~/.ssh/id_rsa_$email.pub