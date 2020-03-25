## IEEE 802.11a PHY Simulator

This simulator is integrated by several parts which constitute physical layer of IEEE 802.11a protocol. Typical modulation: BPSK / 16QAM 

- Run 'main.m' will run programme in Console

- Run 'app1.mlapp' will run integrated App (GUI)

Details of protocol can be found in reference 

## Script description

* add_cp -> Add Cyclic Prefix
* delete_cp -> Delete Cyclic Prefix
* add_pilot -> Add Pilot Frequency
* coding_conv -> Convolutional Coding
* decoding_conv -> Viterbi Decoding
* cons_map -> Constellation Mapping
* decons_map -> Constellation inverse-Mapping
* interleaving -> Interleaver
* deinterleaving -> De-interleaver
* preamble -> Add Preamble
* scramble -> Scramble
* descramble -> Descramble
* IFFT64 -> OFDM Modulation
* FFT64 -> OFDM Demodulation
* syn -> Synchronisation
* ber_curve -> BER curve producer
* counting -> Counter
* main

## Environment
MATLAB R2019a(update 2), including App Designer

## Reference
>IEEE Std 802.11™-2007
>
>IEEE Standard for Information technology— Telecommunications and information exchange between systems— Local and metropolitan area networks—
Specific requirements, Part 11: Wireless LAN Medium Access Control (MAC) and Physical Layer (PHY) Specifications

## License
This code is distributed under MIT LICENSE

## Contact
xieboxuann@gmail.com

