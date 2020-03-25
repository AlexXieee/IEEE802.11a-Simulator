function time_signal = add_pilot(time_syms)

num_symbols = size(time_syms, 2)/64;%Trans Sign neeeded £¨64 elements/sign£©
time_signal = zeros(1, num_symbols*80);%Produce original state in time domin

% Add CP
symbols = reshape(time_syms(:), 64, num_symbols);
tmp_syms = [symbols(49:64,:); symbols]; 
tmp_syms(1,:)=tmp_syms(1,:)*0.5;%Add windows in both head and tail of sign
tmp_syms_end(1,:)=symbols(1,:)*0.5;

tmp_syms(1,2:num_symbols)=tmp_syms(1,2:num_symbols)+tmp_syms_end(1:num_symbols-1);
time_signal(:) = tmp_syms(:).';
end