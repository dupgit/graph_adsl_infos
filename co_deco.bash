#!/bin/bash
mydate=$(date +"%Y/%m/%d/%H-%M")
dossier=$(date +"%Y/%m/%d")
mkdir -p /home/dup/Dossiers_Perso/fbox/$dossier
wget -qq -O /home/dup/Dossiers_Perso/fbox/$mydate-fbox.txt http://192.168.27.30/pub/fbx_info.txt
