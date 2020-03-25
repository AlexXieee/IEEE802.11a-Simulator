function DEINTER = deinterleaving( dInput,flag )
Data = dInput;
DataNum = length(Data);
if flag==1
    Ncbps = 48;
    Nbpsc =1;
else
    Ncbps = 192;
    Nbpsc =4;
end
Mod = mod(DataNum, Ncbps);
 NewD = zeros(1, DataNum);
 Nend = zeros(1, DataNum);
 s = max(Nbpsc/2, 1);
for j = 0:DataNum-1
    t1 = Data(1, j+1);
    i = s*floor(j/s)+mod((j+floor(16*j/Ncbps)),s);
    NewD(1, i+1) = t1;
end
for i =0:length(NewD)-1
    t1 = NewD(1,i+1);
    k = 16*i-(Ncbps-1)*floor(16*i/Ncbps);
    Nend(1, k+1) = t1;
end
if flag==1
    DEINTER = Nend;
else
DEINTER = Nend;
end
end
