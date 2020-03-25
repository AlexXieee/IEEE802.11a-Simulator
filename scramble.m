function data_out=scramble(dInput)
D_init=[1,1,1,1,1,1,1];
for k=1:127
EX=xor(D_init(4),D_init(7));
D_init=circshift(D_init,[1,1]);
D_init(1)=EX;
data(k)=EX;
end
len=length(dInput);
n=mod(len,127);
if n==0
    data=repmat(data,1,floor(len/127));
    data_out=xor(dInput,data);
else
for m=1:n
d(m)=data(m);
end
data=repmat(data,1,floor(len/127));
r=[data,d];
data_out=double(xor(dInput,r));
end
end

