clear all
close all

n =4;
m = 50;
t = 3;
sigma = 0.0001;
T = 50;
epsilon = 0.01;
trail =2;
[Error_EM, Error_sdp_ref, Time]=test_out(m,n,t,sigma,trail,T, epsilon);





