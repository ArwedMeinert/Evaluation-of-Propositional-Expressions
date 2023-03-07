clc
clear all
warning("off");
############################################################
# Hier eine 1 eintragen, Wenn der Auszuwertende Ausdruck in der Konsoleeingegeben werden kÃ¶nnen soll!!!!!
texteingabe_ueber_console=1;
############################################################
if (texteingabe_ueber_console==1)
  merker=0;
  disp("Bitte geben Sie hier den aussagenlogishcen Ausdruck ein, den Sie Auswerten mÃ¶chten. Schreiben Sie alles klein!");
  disp("Die dabei zu verwendenden Operatoren lauten:");
disp("nicht");
disp("und");
disp("oder");
disp("alterniert");
disp("impliziert");
disp("gleichwertig");
disp("z.B.: a oder nicht b impliziert c");
disp("Möchten Sie einen Aussagenlogischen Ausdruck in der Form '(a&b|c)->a' eingeben, geben Sie an dieser Stelle '0' ein.")
text=input('Aussagenlogischen Ausdruck eingeben:','s');
disp("Geben sie nun alle Namen der Variablen ein, die Sie in dem Aussagenlogischen Ausdruck verwendet haben:");
j=1;
if text=='0'
  merker=1;
  disp("Bitte geben Sie den Aussagenlogischen Ausdruck ein. Dabei müssen die folgenden Operatorn genutzt werden:");
   disp("nicht: ~");
   disp("und: &");
   disp("oder: |");
   disp("entweder ... oder ... : #");
   disp("wenn ..., dann ... : ->");
   disp("... genau dann, wenn ... : <->");
   disp("Dabei können Klammern verwendet werden.");
   strg=input('Aussagenlogischen Ausdruck eingeben:','s');
   while 1
  disp("geben Sie nun die von ihnen verwendeten Variabeln ein. Bestätigen Sie jede einzelne Variable mit enter.");
  temp=input('Wenn alle Variablen eingegeben wurden schreiben Sie 0  ','s')
    if temp!='0'
    variablen(j)=temp;
    else
    break;
    endif
  j++;
 endwhile
else
 disp("Geben sie nun alle Namen der Variablen ein, die Sie in dem Aussagenlogischen Ausdruck verwendet haben:");
j=1;
   while 1
  disp('Name der ');
  disp(j);
  temp=input('ten Variable (Wenn alle Variablen eingegeben wurden schreiben Sie 0  ','s')
  
    if temp!='0'
    namen{j,1}=temp;
    else
    break;
    endif
  j++;
 endwhile
endif
else
 ######################################
 #Hier den Text und die Namen der Variablen  eintragen!!!!!!!
 #MÃ¶gliche Logische Operatoren:
 # nicht
 # oder
 # und
 # impliziert
 # gleichwertig
 # alterniert
 ######################################
 #Wenn die Variable auf 0 ist, bitte die eingabe in der verkürzten Schreibweise ausführen!!!
 eingabe_in_alltagssprache=0;
 if eingabe_in_alltagssprache==1
   ##############################
   # Eingabe in alltagssprache
   ##############################
   text="bier oder nicht schnitzel impliziert bier und schnitzel oder wein";
   namen={"bier";"schnitzel";"wein"};#cell array
   merker=0;
 else
   merker=1;
   ###############################
   # Eingabe in kurzschreibweise!!!!!
   ###############################
   strg="a&(b|c)";
   variablen=['a','b','c']
   endif
endif
if merker==0
[strg,variablen]=stringInAussagenlogik(namen,text);
endif
disp("Der aussagenlogische Ausdruck in kurzschreibweise:");
disp(char(strg))
disp("Die Variablen in der sie in die Wahrheitstabelle eingetragen werden:");
disp(char(variablen))
n=0;
##########################################
# Erzeugen der Wahrheitstabelle 
##########################################
wahrheitswerte=zeros(2^numel(variablen),numel(variablen)+1);
strg_wahrheitswerte=zeros(2^numel(variablen)^2,numel(variablen));
while (n<2^numel(variablen)) 
strg_wahrheitswerte(n+1,:)=dec2bin(n,numel(variablen));
k=1;
for (i=1:numel(variablen))
  if(strg_wahrheitswerte((n+1),i)==48)
  wahrheitswerte((n+1),k)=0;
  else
  wahrheitswerte((n+1),k)=1;
  endif
  k++;
endfor
wahrheitswerte(n+1,numel(variablen)+1)=klammernauswerten(strg,variablen,wahrheitswerte(n+1,1:numel(variablen)));
n++;
endwhile
wahrheitswerte