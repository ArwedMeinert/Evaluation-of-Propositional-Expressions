
function[t]=klammernauswerten(strg,variablen,werte)
temp=[];
strg1=[];
  for i=1:length(strg) #Ersetzen der variablen im String mit 1 oder 0 je nach wert
    merker=0;
    for n=1:numel(variablen)
      
      if(strg(i)==variablen(n))
      strg1(i)=int2str(werte(n));
      merker=1;
      endif
    endfor  
  if(merker==0)
    strg1(i)=strg(i);
  endif
endfor
zaeler=1;
klammer_zu=strfind(char(strg1),')'); #sring wird nach Klammern durchsucht
if (klammer_zu!=0)
  for i=1:length(klammer_zu)
    temp=[];
    k=1;
    while char(strg1(klammer_zu(i)-k))!='('
      k++;
    endwhile
    
    
    for n=1:k-1
      temp(n)=char(strg1(klammer_zu(i)-k+n));
      char(temp);
    endfor
    char(temp);
    strg1(klammer_zu(i))=int2str(logikAuswerten(temp));
    char(strg1);
    for n=1:k
      strg1(klammer_zu(i)-(n-1)-1)=[];
    endfor
    for n=1:length(klammer_zu)
      klammer_zu(n)=klammer_zu(n)-k;
      
    endfor
    
    char(strg1);
    
    
  endfor
  t=logikAuswerten(strg1); #Erzeugen des ergebnis
  
elseif
  t=logikAuswerten(strg1); #Erzeugen des ergebnis
  
endif





#t=logikAuswerten(strg1); #Erzeugen des ergebnis

endfunction




