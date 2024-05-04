function [ A,x_real,y_pure,y, noise ] = generate_mat( m,n,sigma )
% input:
% m: int;
% n: int;
% sigma: float, noise standard deviation;

% output:
% A: m*n matrix;
% x_real: n*1 float, real solution;
% y_pure: m*1 float, pure measurement;
% y : m*1 float corrupted measurement.

A = randn(m,n);
x_real = rand(n,1);
y_pure = A*x_real;
noise = sigma * randn(m,1);
y = y_pure + noise;

end

