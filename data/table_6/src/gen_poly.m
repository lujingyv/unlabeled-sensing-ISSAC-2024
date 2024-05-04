function [Q, x] = gen_poly(A, y)
% input:
% A m*n matrix
% y m*1 vector
% output
% Q (n)*1 vector, Q(k) the k th newton polynomial
% x: n*1 vector, unknown


% construct unknowns
[~,n] = size(A);

% if n == 2
%     syms a be;
%     x = [a;be];
% elseif n == 3
%     syms a be c;
%     x = [a;be;c];
% elseif n == 4
%     syms a be c d;
%     x = [a; be;c ;d];
% 
% elseif n ==5
%     syms a be c d e;
%     x = [a;be;c;d;e];
%     
% else
%     syms a be c d e f;
%     x =[a;be;c;d;e;f];
% end

x = sym('x', [n,1]);

for k = 1:n
    Q(k,1) = 10*(sym_sum(A*x, k)-sym_sum(y,k));
    [C,T] = coeffs(Q(k,1),x);
    C0 = round(double(C),4);
    [~,len] = size(C0); 
    p = 0;
    for i = 1:len
        p = p+ C0(i)*T(i);
    end
    Q(k,1) = p;
end
    
    
end



function newton = sym_sum(L, k)
% L vector
% k k th power

% newton k th newton polynomial
newton = sum(L.^k);
end
