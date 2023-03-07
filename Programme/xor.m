function[w]=xor(a,b)
w=or(and(not(a),b),and(a,not(b)));
endfunction