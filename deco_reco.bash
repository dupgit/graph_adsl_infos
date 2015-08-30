#!/bin/bash
rm -f deco_reco_all;
rm -f attenuation.txt
find -type f -name "*-fbox.txt" >deco_reco_list
for i in $(sort deco_reco_list); do 
   grep "Date" -A 25 $i | tail -n 23 >>deco_reco_all; 
   date=$(echo $i |sed -e 's,\.\/,,' -e 's/-fbox\.txt//'); 
   down=$(grep "nuation" $i | cut -d' ' -f 15); 
   up=$(grep "nuation" $i | cut -d' ' -f 27);
   marged=$(grep "bruit" $i | cut -d' ' -f14);
   margem=$(grep "bruit" $i | cut -d' ' -f27);
   echo $date $down $marged $up $margem>>attenuation.txt;
done;
sort deco_reco_all | uniq >deco_reco.txt
grep Connexion deco_reco.txt | cut -d' ' -f 3,5,21 >deco_reco_download.txt
grep Connexion deco_reco.txt | cut -d' ' -f 3,5,23 >deco_reco_upload.txt
