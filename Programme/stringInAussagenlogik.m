function[strgneu,variablen]=stringInAussagenlogik(a,text)
n=1;
variablen=[];
for(i=1:size(a,1)) ## Stellen in dem String in dem die Variablen vorkommen suchen
s{i}=strfind(text,a{i});
s{i};
variablen(i)=a{i}(1);
endfor

n=1;


nicht="nicht";
und="und";
oder="oder";
impliziert="impliziert";
alterniert="alterniert";
gleichwertig="gleichwertig";
strg=zeros(1,length(text));
o{1}=strfind(text,nicht); ## Stellen im String an denen die Operatoren vorkommen suchen
o{2}=strfind(text,und);
o{3}=strfind(text,oder);
o{4}=strfind(text,impliziert);
o{5}=strfind(text,alterniert);
o{6}=strfind(text,gleichwertig);

for i=1:length(text) ## Jedes Zeichen im Text durchlaufen
  a=0;
  for k=1:length(s) ## Variablenvektor durchlaufen
    
    for l=1:length(s{k})
      if s{k}(l)==i ## Stelle des Variablenvektors mit aktueller stelle im text verglecihen
        strg(i)=variablen(k); ## Variable durch kurzzeichen ersetzen
        
      endif
      
    endfor
  a++;
  endfor
  
  for k=1:length(o) ## durchlaufen der operatoren
    
    for l=1:length(o{k}) ##stelle an denen der operator vorkommt mit aktueller stelle vergleichen
      if (o{k}(l)==i) ##operatoren durch kurzzeichen ersetzen
        if (k==1)
          strg(i)='~';
          elseif (k==2)
          strg(i)='&';
          elseif (k==3)
          strg(i)='|';
          elseif (k==4)
          strg(i)='-';
          strg(i+1)=">";
          elseif (k==5)
          strg(i)='#';
          elseif (k==6)
          strg(i)='<';
          strg(i+1)='-';
          strg(i+2)='>';
          endif
      endif
     endfor
   endfor
endfor
a=1;
strgneu=[];
i=1;
while i<length(strg) ##leerstellen im string löschen
  if (strg(i)!=0)
    strgneu(a)=strg(i);
    a++;
  
  endif
  i++;
 endwhile
 

endfunction