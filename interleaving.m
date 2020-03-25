function INTER = interleaving( dInput,flag )
DataNum = length(dInput);
if flag==1
    Ncbps = 48;
    Nbpsc =1;
else
    Ncbps = 192;
    Nbpsc =4;
end
Mod = mod(DataNum, Ncbps);
t = Ncbps-Mod;
if t==Ncbps
    t = 0;
end
%Add Zero
Data = dInput;
NewD = zeros(1, DataNum+t);
Nend = zeros(1, DataNum+t);
InputD = zeros(1, DataNum+t);
%Initial self-sequence£¬1st metathesis seq,2nd metathesis seq
InputD(1:DataNum) = Data(1:DataNum);
Data = InputD;
DevideNum = (DataNum+t)/Nbpsc;
Devide = reshape(Data, Nbpsc, DevideNum);
Devide = reshape(Devide, 1, []);
%Serial transform
Data = Devide;
s = max(Nbpsc/2, 1);
t = length(Data);
for k = 0:length(Data)-1
    t1 = Data(1, k+1);
    i = (Ncbps/16)*(mod(k,16))+floor(k/16);
    NewD(1, i+1) = t1;
    %1st metathesis
end
 
for i =0:length(NewD)-1
    t1 = NewD(1,i+1);
    j = s*floor(i/s)+mod((i+Ncbps-floor(16*i/Ncbps)), s);
    Nend(1, j+1) = t1;
    %2nd metathesis
end
INTER = Nend;
end

