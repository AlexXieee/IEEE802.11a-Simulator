function Number=count(data_one,data_two)
    num=0;
for k=1:length(data_one)
        if data_one(k)~=data_two(k)
            num=num+1;
        end
end
Number=num;
end
