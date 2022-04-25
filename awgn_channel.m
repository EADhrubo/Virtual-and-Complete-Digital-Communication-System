function mc=awgn_channel(m,SNR)

mc= awgn(m, SNR, 'measured');

end