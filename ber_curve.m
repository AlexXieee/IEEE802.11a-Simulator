chan = comm.RayleighChannel('SampleRate',1e4,'MaximumDopplerShift',100);
M = 2; % DBPSK modulation order
tx = randi([0 M-1],50000,1); % Generate a random bit stream

mod = comm.DBPSKModulator;
demod = comm.DBPSKDemodulator;

dpskSig = mod(tx);
fadedSig = chan(dpskSig); % Apply the channel effects

awgnChan = comm.AWGNChannel('NoiseMethod', 'Signal to noise ratio (SNR)');
errorCalc = comm.ErrorRate;

SNR = 0:2:20; % Range of SNR values, in dB.
numSNR = length(SNR);
berVec = zeros(3, numSNR); % Preallocate a vector for BER results 

for n = 1:numSNR
   awgnChan.SNR = SNR(n);
   rxSig = awgnChan(fadedSig); % Add Gaussian noise
   rx = demod(rxSig);  % Demodulate
   reset(errorCalc)
  
   berVec(:,n) = errorCalc(tx,rx); % Compute error rate.
end
BER = berVec(1,:);

BERtheory = berfading(SNR,'dpsk',M,1);

semilogy(SNR,BERtheory,'b-',SNR,BER,'r*');
legend('Theoretical BER','Empirical BER');
xlabel('SNR (dB)'); ylabel('BER');
title('Binary DPSK over Rayleigh Fading Channel');