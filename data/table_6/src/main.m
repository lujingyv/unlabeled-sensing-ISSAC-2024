clear all
close all

m = 500;
n = 3;
SNR = 80;



trail = 20;
T = 50;
epsilon = 0.01;
sigma = sigma_SNR(n, SNR);

%[Error_EM, Error_homo, Time_EM,Time_homo,nroot]=test(m,n,sigma,trail,T, epsilon)

[Error_EM, Error_homo,Time_EM ,Time_homo,nroot]=test(m,n,sigma,trail,T, epsilon);

data = [Error_EM, Error_homo,Time_EM ,Time_homo,nroot];

data_average = median(data);

xlswrite('data.xlsx',data,1);
xlswrite('data.xlsx',data_average,2);