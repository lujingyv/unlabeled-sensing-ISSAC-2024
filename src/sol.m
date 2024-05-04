function [x_EM, x_nref, time]=sol(A,y,t,T, epsilon)
% input:
% A: m*n matrix;
% y: n*1 vector, permuted measurement;
% t: relaxation order
% T: int, maximal number of iterations for alternating minimization
% epsilon: float, convergence accuracy of alternating minimization

% output:
% x: n*1 vector, numerical solution;
% time: float number;



[m,n] = size(A);

% construct systerm
[x,K,Q] = constrain_supp(A,y);


t1 = cputime;
% sdp solve the system
x_sdp = sdp_solve(x,K,t);

% refine x_sdp by newton iteration

x_nref = newton_refine(x_sdp, Q,x);

% AIEM refine the result
x_EM = SLR_hardEM(A,y,x_nref,T,epsilon);

t2 = cputime;

time = t2-t1;

end