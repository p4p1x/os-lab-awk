#!/bin/bash

if [ "$#" -eq 1 ] && [ -f $1 ]  
then
    #([21][90])([0-9][0-9])-(1[012]|0[1-9])-(3[01]|[12][0-9]|0[1-9]) yyyy-mm-dd
    awk ' 
       match($0, /([21][90])([0-9][0-9])-(1[012]|0[1-9])-(3[01]|[12][0-9]|0[1-9])/, tab) {
            mm=tab[3]
            dd=tab[4]
            yy=tab[2]
            all=mm "/" dd "/" yy
            $0=gensub(/([21][90])([0-9][0-9])-(1[012]|0[1-9])-(3[01]|[12][0-9]|0[1-9])/, all, "g")
            print $0
        }       
    ' $1
else 
    exit 0;
fi



#w danym pliku tekstowym zamienic wsyzstkie daty w formacie yyyy-mm-dd na mm/dd/yy