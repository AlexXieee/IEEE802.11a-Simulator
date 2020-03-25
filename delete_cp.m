function rx_time_data=delete_cp(rx_frame)

frame_length=length(rx_frame);
rx_data=rx_frame(321:frame_length);
num_symbols =floor(size(rx_data, 2)/80);%Need Sign received£¨80 elements/sign£©
rx_data=rx_data(1:80*num_symbols);

% Delete CP
symbols = reshape(rx_data(:), 80, num_symbols);
symbols(1:16,:)=[]; 
rx_time_data = symbols;
end