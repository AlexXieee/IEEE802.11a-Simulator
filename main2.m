function [ber]=main2(p_flag,p_snr)
clc
flag=p_flag
Number=1000
Power=-3
snr=p_snr;
%Preamble
Preamble=preamble();
%Signal
if flag==1
    Singal=[1 1 0 1 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0];
    N=24;
    R=1/2;
    Q=1;
elseif flag==2
        Singal=[1 0 1 1 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0];
        N=144;
        R=3/4;
        Q=4;
else disp('Input error!');
    return;
end
%Modulation----------------------------------------------------------------
%Signal
sdeConv=coding_conv(Singal,1);
sInter=interleaving(sdeConv,1);
sModu=cons_map(sInter,1);
sPilot=add_pilot(sModu);
sOFDMModu=IFFT64(sPilot);
sCP=add_cp(sOFDMModu);
%Data
tmp=Number+(N-mod(Number,N));
dTrans=randi([0,1],1,tmp);

dTrans(1:Number)
dScr=scramble(dTrans);
dConv=coding_conv(dScr,1);
for K=0:length(dConv)/(N/R)-1
    dT=dConv((K*N/R+1):((K+1)*N/R));
    dInter=interleaving(dT,flag);
    dHandled((K*N/R+1):((K+1)*N/R))=dInter(1:N/R);
end
dModu=cons_map(dHandled,flag);
dPilot=add_pilot(dModu);
dOFDMModu=IFFT64(dPilot);
dCP=add_cp(dOFDMModu);
%PPDU frame
PPDU_tmp=[Preamble sCP dCP];
%Noise
PPDU=PPDU_tmp+awgn(PPDU_tmp,snr,Power);

%--------------------------------------------------------------------------
%Synchronization
if ~syn(PPDU,Preamble);

    return;
end
[~,data_syms,~]=FFT64(PPDU);

%Demodulation--------------------------------------------------------------
%Singal
sTmp=data_syms(1:48);
sdeModu=decons_map(sTmp,1);
sdeInter=deinterleaving(sdeModu,1);
sdeConv=decoding_conv(sdeInter,1);
sRec=sdeConv;
%Data
dTmp=data_syms(49:tmp/R/Q+48);
compensation=abs(real(dModu(1)/real(dTmp(1))));
ddeModu=decons_map(dTmp,flag,compensation);
for M=0:length(ddeModu)/(N/R)-1;
    data_t=ddeModu((M*N/R+1):((M+1)*N/R));
    ddeInter=deinterleaving(data_t,flag);
    dRectmpa((M*N/R+1):((M+1)*N/R))=ddeInter(1:N/R);
end
ddeConv=decoding_conv(dRectmpa,1);
dRec=scramble(ddeConv);

dRec(1:Number);


berNum=counting(dTrans(1:Number),dRec(1:Number));
ber=(berNum/(Number));

end