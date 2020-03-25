function CM = cons_map(dInput,flag)
Data = dInput;
if flag==1
        CM=zeros(1,length(Data));
for i=1:length(Data)
    if Data(i)<=0
        CM(i)=-1;
    else
        CM(i)=1;
    end
end
elseif flag==2
DataNum = length(Data);
Mod = mod(DataNum, 4);
if Mod==0
    DataTem=zeros(1,DataNum);
else
DataTem = zeros(1, DataNum+(4-Mod));
end
DataTem(1:DataNum) = Data;
DataCol4 = reshape(DataTem, 4, [])';
DataHexa = (DataCol4*[8;4;2;1]+1)';
DataHxaNum = length(DataHexa);
x = [-3 -1 3 1];
y = [-3 -1 3 1];
z = zeros(1,16);
k = 1;
for k1 = 1:4
    for k2 = 1:4
        z(1, k) = x(1,k1)+y(1,k2)*1i;
        k = k+1;
    end
end
z = reshape(z, 1, 16);
for i = 1:DataHxaNum
    DataTem(1, i) = z(1, DataHexa(1, i));
end
scatterplot(DataTem(1:DataHxaNum));
DataTem = DataTem*(1/sqrt(10));
CM = DataTem(1:DataHxaNum);
end
end
