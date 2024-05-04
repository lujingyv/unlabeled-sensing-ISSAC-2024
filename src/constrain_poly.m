
function [x,Q] = constrain_poly(A, y)
% input:
% A m*n matrix
% y m*1 vector
% output
% Q (n+1)*1 vector, Q(k) the k th newton polynomial
% x: n*1 vector, unknown
[m,n] = size(A);

if n == 2
    mpol x 2;
elseif n ==3
    mpol x 3;
elseif n == 4
    mpol x 4;
elseif n ==5
    mpol x 5;
elseif n ==6
    mpol x 6;
else
    display('n too large.');
end

for k = 1:n+1
    Q(k,1) = sym_sum(A*x, k)-sym_sum(y,k);

end


end




function newton = sym_sum(L, k)
% L vector
% k k th power

% newton k th newton polynomial
newton = sum(L.^k);
end




