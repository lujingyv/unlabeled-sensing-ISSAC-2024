function [x_EM,x_homo,time_EM,time_homo,S_r,I] = sol(A,y,T, epsilon)
% input:
% A: m*n matrix; 
% y: m*1 vector;
% T: int, interation number in EM
% epsilon: float, accuracy in EM
% output:
% S_r: n*I matrix, real part of solution;
% I: int, number of solution;
% time_sol: float, time on solve;

% initialize

% generate polynomial
[Q, x] = gen_poly(A, y);

t1 = cputime;
% homotopy solve polynomial
[S,I] = homo_solve(Q, x);

% extract real part
S_r = real(S);

Xi_AI_hat = S_r;

% estimate the most suitable root of the polynomial system
e_AI_hat = vecnorm(sort(y) - sort(A*Xi_AI_hat, 1));
[~, index] = min(e_AI_hat);
x_homo = squeeze(Xi_AI_hat(:, index));

t2 = cputime;
% time for homotopy and selection
time_homo = t2- t1;

t3 = cputime;

[x_EM,~] = SLR_hardEM(A,y,x_homo,T,epsilon);
t4 = cputime;


time_EM = t4 -t3;




end
