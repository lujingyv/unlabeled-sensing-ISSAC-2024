function [S,I] = homo_solve(Q, x)
% input:
% Q: n*1 vector, symbol polynomial;
%
% x : n*1 sym vector, unknowns
% output: 
% S: n*I matrix, solution;
% I: int, number of solutions;


[n,~] = size(x);

Q_num = sym2num_str(Q,x);
[P,~] = num2P(Q_num, x);
[rootcell, I] = HOM4PS2(n, P, 2);
S = extract_cell(rootcell, I,n);

end

