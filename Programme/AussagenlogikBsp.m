clc
clear all
logik=[]; ##leere Matrix erstellen
n=1;
for a=0:1 ##alle kombinationen für a,b,c durchlaufen
  for b=0:1
    for c=0:1
    logik(n,1:3)=[a,b,c]; ##Logische Werte in Matrix schreiben
    logik(n,4)=a|b&c; ##Ergebnis in letzte zeile schreiben
    n++;
    endfor
  endfor
endfor
logik ##Matrix ausgeben