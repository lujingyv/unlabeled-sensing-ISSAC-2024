clear all
close all

m = 500;
n = 4;
t = 3;
SNR = 60;



trail = 10;
T = 50;
epsilon = 0.01;
sigma = sigma_SNR(n, SNR);



[Error_EM, Error_sdp_ref, Time]=test_out(m,n,t,sigma,trail,T, epsilon);
data = [Error_EM, Error_sdp_ref, Time];
data_average = mean(data);

%data_out = {['Error_EM', 'Error_sdp_ref', 'Time'];data}; 
%data_average_out = {['Error_EM', 'Error_sdp_ref', 'Time'];data_average};
xlswrite('data.xlsx',data,1);
xlswrite('data.xlsx',data_average,2);

