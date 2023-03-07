
function[t]=logikAuswerten(strgneu)
temp=[];
strg1=[];
  
zaeler=1;
i=1;
while (i<length(strgneu))#der string wird nach den Operatoren #, ->,<-> durchsucht
  if (char(strgneu(i))=='~') #wird mit den einzelnen WErten ausgewertet
    temp=char(['~',char(strgneu(i+1))]);
    answer=eval(temp);
    int2str(answer);
    strgneu(i)=(int2str(answer));
    strgneu(i+1)=[];
    
  endif
  i++;
  char(strgneu);
endwhile
i=1;
char(strgneu);

while (i<length(strgneu))#der string wird nach den Operatoren #, ->,<-> durchsucht
  if (char(strgneu(i))=='&') #wird mit den einzelnen WErten ausgewertet
    temp=char([char(strgneu(i-1)),'&',char(strgneu(i+1))]);
    answer=eval(temp);
    int2str(answer);
    strgneu(i)=(int2str(answer));
    strgneu(i+1)=[];
    strgneu(i-1)=[];
  endif
  i++;
  char(strgneu);
endwhile
i=1;

while (i<length(strgneu))#der string wird nach den Operatoren #, ->,<-> durchsucht
  if (char(strgneu(i))=='|') #wird mit den einzelnen WErten ausgewertet
    temp=char([char(strgneu(i-1)),'|',char(strgneu(i+1))]);
    answer=eval(temp);
    int2str(answer);
    strgneu(i)=(int2str(answer));
    strgneu(i+1)=[];
    strgneu(i-1)=[];
  endif
  i++;
  char(strgneu);
endwhile
i=1;

while (i<length(strgneu))#der string wird nach den Operatoren #, ->,<-> durchsucht
  if (char(strgneu(i))=='<') #wird mit den einzelnen WErten ausgewertet
    temp=char(['gdw(',char(strgneu(i-1)),',',char(strgneu(i+3)),')']);
    answer=eval(temp);
    int2str(answer);
    strgneu(i-1)=(int2str(answer));
    strgneu(i+3)=[];
    strgneu(i+2)=[];
    strgneu(i+1)=[];
    strgneu(i)=[];
  endif
  i++;
  char(strgneu);
endwhile
i=1;
while (i<length(strgneu))#der string wird nach den Operatoren #, ->,<-> durchsucht
  if (char(strgneu(i))=='#') #wird mit den einzelnen WErten ausgewertet
    temp=char(['xor(',char(strgneu(i-1)),',',char(strgneu(i+1)),')']);
    answer=eval(temp);
    int2str(answer);
    strgneu(i-1)=(int2str(answer));
    strgneu(i+1)=[];
    strgneu(i)=[];
  endif
  i++;
  char(strgneu);
endwhile
i=1;

while (i<length(strgneu))#der string wird nach den Operatoren #, ->,<-> durchsucht
  if (char(strgneu(i))=='>') #wird mit den einzelnen WErten ausgewertet
    temp=char(['implikation(',char(strgneu(i-2)),',',char(strgneu(i+1)),')']);
    answer=eval(temp);
    int2str(answer);
    strgneu(i-2)=(int2str(answer));
    strgneu(i+1)=[];
    strgneu(i)=[];
    strgneu(i-1)=[];
  endif
  i++;
  char(strgneu);
endwhile
i=1;




t=eval(char(strgneu)); #Erzeugen des ergebnis

endfunction




