function DCM = decons_map(input_data,flag,compensation)
Data = input_data;
if flag==1
    DCM=zeros(1,length(Data));
for i=1:length(Data)
    if Data(i)<0
        DCM(i)=0;
    else
        DCM(i)=1;
    end
end
elseif flag==2
DataNum = length(Data);
Data = Data*(sqrt(10));
NewData = zeros(1, DataNum);
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
Data=Data*compensation;
for k=1:DataNum
    for k1 = 1:16
       if abs(Data(1, k)-z(1, k1))<(0.1)
           NewData(1, k) = k1;      
       end
    end
end
NewData = NewData-1;
Num = DataNum*4;
FData = zeros(1, Num);
k2 = 0;
for k = 1:DataNum
    k3 = 4;
    for k1 = 1:4
       FData(1,k2+k3) = mod(NewData(1, k), 2);
       NewData(1, k) = floor(NewData(1, k)/2);
       k3 = k3-1;
    end
    k2 = k2+4;
end
scatterplot(Data);
DCM = FData;
end
end
