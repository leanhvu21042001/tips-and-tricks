#!/bin/bash

cd ~/.ssh/
echo "Enter your email: "; read email;
echo "Enter your username: "; read username;

ssh-keygen -t rsa -C "$email" -f "id_rsa_$email";

touch config
echo >> config;
echo >> config;
echo "# GitHub $username" >> config
echo "Host github.com-$username" >> config
echo "HostName github.com" >> config
echo "User git" >> config
echo "IdentityFile ~/.ssh/id_rsa_$email" >> config

eval "$(ssh-agent -s)"
ssh-add -D
ssh-add id_rsa_$email
ssh-add -l

echo;
echo "SSH Key: "
echo;

cat id_rsa_$email.pub