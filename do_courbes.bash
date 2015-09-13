#!/bin/bash
# Whole prefix, everything is supposed to be below this. 
chemin="/home/dup/Dossiers_Perso/fbox"

# Directory where are stored downloaded txt files
dossier=$(date +"%Y/%m/%d/")

# Date to be used in the subject of the final mail.
mydate=$(date +"%d %m %Y")

# Prefix for generated files.
filedate=$(date +"%Y%m%d")

# Final destination of generated txt and images files.
dest=$(date +"%Y/%m/")

# Going to the main directory
cd $chemin

# Cleaning
rm -f FEC.txt HEC.txt CRC.txt

# Extracting values for FEC HEC and CRC
for i in $(ls $dossier); do
   j=$(echo $i |sed s/-fbox\.txt//)
   echo -n $dossier $j | tee -a FEC.txt HEC.txt CRC.txt > /dev/null
   for t in FEC HEC CRC; do 
      grep $t $dossier/$i >> $t.txt
   done;
done;

# Ploting things
gnuplot gnuplot_script

# Moving the results to the destination
for t in FEC HEC CRC; do
   mv courbe-$t.png $dest/$filedate-$t.png
   mv $t.txt $dest/$filedate-$t.txt
done;

# Sending the final mail
mutt -F ~/.mutt/muttrc.mymail@free.fr -s "Images du $mydate" -a $dest/$filedate-FEC.png $dest/$filedate-HEC.png $dest/$filedate-CRC.png -- mymail@free.fr myother@gmail.com < message
