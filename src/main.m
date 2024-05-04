clear all
close all

m = 500;
n = 3;
t = 2;
SNR = 100;



trial = 12;
T = 50;
epsilon = 0.01;
sigma = sigma_SNR(n, SNR);



[Error_EM, Error_sdp_ref, Time]=test(m,n,t,sigma,trial,T, epsilon);
data = [Error_EM, Error_sdp_ref, Time];
data_average = mean(data);

%data_out = {['Error_EM', 'Error_sdp_ref', 'Time'];data}; 
%data_average_out = {['Error_EM', 'Error_sdp_ref', 'Time'];data_average};
xlswrite('data2.xlsx',data,1);
xlswrite('data2.xlsx',data_average,2);



