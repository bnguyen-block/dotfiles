#! /usr/bin/env bash

today=$(date +"%d-%m-%Y")
mv /etc/zshenv{,.$today}
mv /etc/zshrc{,.$today}
mv /etc/bashrc{,.$today}
