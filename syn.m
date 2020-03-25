function P=syn(PPDU,preamble)
P=1;
b=0;
d=preamble;
a=[];
for i=1:200
    a=abs(dot(PPDU(i:i+15),d(1:16)));%dot:Conjugating and transposition of [data(i:i+15)] *d(1:16)
    if a>1.5%Peak value
        b=b+1;
        if b==10
            v=abs(i-144);
            a=PPDU(v:length(PPDU));%One period exists, store the remnent data to another.
        elseif b~=10&&i==200
           P=0;
            break;
        end
    end
end
end