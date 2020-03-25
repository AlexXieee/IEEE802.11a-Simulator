function mod_ofdm_syms = add_pilot(mod_syms)

PilotScramble=[1 1 1 1 -1 -1 -1 1 -1 -1 -1 -1 1 1 -1 1 -1 -1 1 1 -1 1 1 -1 1 1 1 1 ...
      1 1 -1 1 1 1 -1 1 1 -1 -1 1 1 1 -1 1 -1 -1 -1 1 -1 1 -1 -1 1 -1 -1 1 1 1 1 1 -1 -1 1 ...
      1 -1 -1 1 -1 1 -1 1 1 -1 -1 -1 1 1 -1 -1 -1 -1 1 -1 -1 1 -1 1 1 1 1 -1 1 -1 1 -1 1 -1 ...
      -1 -1 -1 -1 1 -1 1 1 -1 1 -1 1 1 1 -1 -1 1 -1 -1 -1 1 1 1 -1 -1 -1 -1 -1 -1 -1];%Pilot scrambled data
NumDataSubc=48;% amt of data sub-cw
NumSubc=52;% amt of sub-cw
DataSubcPatt=[1:5 7:19 21:26 27:32 34:46 48:52]';% pos of data sub-cw
PilotSubcPatt=[6 20 33 47]';% pos of pilot sub-cw
NumPilotSubc=4;% amt of pilot sub-cw
PilotSubcSymbols=[1;1;1;-1];% sign of pilot sub-cw

n_mod_syms = size(mod_syms,2);% Map modu signs transed
n_ofdm_syms = ceil(n_mod_syms/NumDataSubc);% OFDM signs transed
mod_syms=[mod_syms zeros(1,n_ofdm_syms*NumDataSubc-n_mod_syms)];

%pilot scrambling pattern
scramble_patt = repmat(PilotScramble,1,ceil(n_ofdm_syms/length(PilotScramble)));%repeat scrambling pilot£¬with length equal to OFDM signs' at least
scramble_patt = scramble_patt(1:n_ofdm_syms);% Cut pilot with same amt of OFDM signs

mod_ofdm_syms = zeros(NumSubc, n_ofdm_syms);
mod_ofdm_syms(DataSubcPatt,:) = reshape(mod_syms, NumDataSubc, n_ofdm_syms);%Insert mod_syms in data sub-cw, with amt of NumDataSubc 

% Scrambling pilot sub-cw signs seq and insert in the corresponding ones
mod_ofdm_syms(PilotSubcPatt,:) = repmat(scramble_patt, NumPilotSubc,1).*repmat(PilotSubcSymbols, 1, n_ofdm_syms);
% output with pilot inserted
mod_ofdm_syms = mod_ofdm_syms(:).';
end
