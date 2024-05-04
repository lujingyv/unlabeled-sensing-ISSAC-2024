function sigma = sigma_SNR(n,S)
% input:
% m: int, rows;
% n: int, columns;
% S: float, SNR in dB;
% 
% output:
% sigma: float, standard deviation for gaussian noise;

sigma = 10^(0.5*(log10(n)-0.1*S));


end