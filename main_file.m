clc;
clear all;
close all;

[P,Symbol]=source_stat('msg1.txt');

[code,b]= huffman_code(P , Symbol);

encoded = conv_code(b);


ques='Choose between BPSK(enter 0), GMSK(enter 1), BASK(enter 2), BFSK(enter 3): ';
choose=input(ques);
m =line_code(encoded,b,choose);

ques='SNR= ';
SNR=input(ques);
mc=awgn_channel(m,SNR);

md = line_decode(mc,b,choose);

decoded = conv_decode(md);

dec_msg = huffman_decode(decoded,Symbol,code);
disp(['Decoded Message:  ', char(dec_msg)']);

