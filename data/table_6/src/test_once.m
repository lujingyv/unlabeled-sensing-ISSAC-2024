
function [x_real, x_EM, x_homo,error_EM, error_homo, time_EM,time_homo,I]=test_once(m,n,sigma,T, epsilon)
% input:
% m: int;
% n: int;
% t: int, relaxation order;
% sigma: float, noise standard deviation;
% T: int, maxiamal iteration in EM;
% epsilon: float, accuracy in EM;
% 
% output:
% x_EM: n*1 vector, solution refined by EM;
% x_nref: n*1 vector, solution by sdp and newton refinement;
% x_real: real solution;
% error_EM: float, relative error after refinement;
% error_sdp: float, relative error of sdp method;
% time: float, cputime;
  
    
A = randn(m,n);
x_real = rand(n,1);
y_pure = A*x_real;
noise = sigma * randn(m,1);
y = y_pure + noise;
% [x_EM,x_homo,time_EM,time_homo,S_r,I] = sol(A,y,T, epsilon)
[x_EM,x_homo,time_EM,time_homo,~,I] = sol(A,y,T, epsilon);

error_EM = norm(x_EM-x_real)/norm(x_real);
error_homo = norm(x_homo-x_real)/ norm(x_real);

end