#! /usr/bin/env bash

today=$(date +"%d-%m-%Y")
mv /etc/zshenv{,.before-nix-darwin}
mv /etc/zshrc{,.before-nix-darwin}
mv /etc/bashrc{,.before-nix-darwin}
mv /etc/zprofile{,.before-nix-darwin}
