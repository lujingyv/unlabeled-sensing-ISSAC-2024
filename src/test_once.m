
function [ x_real, x_EM, x_nref,error_EM, error_sdp_ref, time]=test_once(m,n,t,sigma,T, epsilon)
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
[x_EM, x_nref, time]=sol(A,y,t,T, epsilon);
error_EM = norm(x_EM-x_real)/norm(x_real);
error_sdp_ref = norm(x_nref-x_real)/ norm(x_real);

end