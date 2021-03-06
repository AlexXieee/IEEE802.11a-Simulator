function [freq_tr_syms, freq_data_syms, freq_pilot_syms] = FFT64(time_signal)

UsedSubcIdx=[7:32 34:59]';
DataSubcIdx=[7:11 13:25 27:32 34:39 41:53 55:59]';
PilotSubcIdx=[12 26 40 54]';

long_tr_syms = time_signal(193:320);%��ȡʱ��ѵ������

long_tr_syms = reshape(long_tr_syms, 64, 2);
% ת����Ƶ��
freq_long_tr = fft(long_tr_syms)/(64/sqrt(52));%ת����Ƶ�� 
reorder = [33:64 1:32];%������
freq_long_tr(reorder,:) = freq_long_tr;   
% ѡ��ѵ������
freq_tr_syms= freq_long_tr(UsedSubcIdx,:);
freq_tr_syms= freq_tr_syms(:).';

% ��ȡData �ֶ�   
freq_data = delete_cp(time_signal);   
% ִ��FFT
freq_data = fft(freq_data)/(64/sqrt(52));   
%%������ [33:64 1:32]
freq_data(reorder,:) = freq_data;   
%ѡ���������ز�
freq_data_syms = freq_data(DataSubcIdx,:);
%ѡ��Ƶ���ز�
freq_pilot_syms = freq_data(PilotSubcIdx,:);

freq_data_syms = freq_data_syms(:).';
freq_pilot_syms = freq_pilot_syms(:).';
end
