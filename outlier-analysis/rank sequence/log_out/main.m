n = 4;
t = 3;

filename= 'log35.xlsx';
M = xlsread(filename,'M');
%y = xlsread(filename, 'y');
%A = xlsread(filename,'A');
%x_real = xlsread(filename,'x_real');
%y_pure = xlsread(filename,'y_pure');
%y =y_pure;

C= svd_seq(M,n,t);



function C = svd_seq(M,n,t)
size_list = sizes(n,t);
C = cell(1,t+1);
for i = 1:t+1
    C{i}  = singular_value(M, size_list(i,1));

end

end
function s = singular_value(M,size)
M_tr = M(1:size, 1:size);
s = svd(M_tr);
end


function size_list = sizes(n, t)
size_list = zeros(t+1,1);
for i = 1:t+1
   size_list(i,1) =  nchoosek(n+i-1,i-1);
    
end
end


function newton = sym_sum(L, k)
% L vector
% k k th power

% newton k th newton polynomial
newton = sum(L.^k);
end

function [x_extract,M_s] = extract_solve(M,n)
% input:
% M: moment matrix;
% n: int, number of unknowns x;
% 
% output:
% x_extract: n*1 vector, solution extracted from M;
% M_s: svd core of M;

[U,S,~] = svd(M);
M_s = diag(S);
sing_vec = U(:,1);
x_extract = zeros(n, 1);
for index = 1:n
    x_extract(index,1) = sing_vec(index+1,1)/sing_vec(1,1);
end

end