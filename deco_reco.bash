#!/bin/bash
rm -f deco_reco_all;
find -type f -name "*-fbox.txt" >deco_reco_list
for i in $(sort deco_reco_list); do grep "Date" -A 25 $i | tail -n 23 >>deco_reco_all; done;
sort deco_reco_all | uniq >deco_reco.txt
