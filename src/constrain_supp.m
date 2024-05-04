function [x,K,Q] = constrain_supp(A, y)
% input:
% A m*n matrix
% y m*1 vector
% output
% K (n+1)*1 vector, n+1 polynomial constrain. 
% Q (n+1)*1 vector, n+1 polynomials
    [~,n] = size(A);
    [x,Q] = constrain_poly(A,y);
    
    for i = 1:n+1
        K(i,1) = (Q(i)==0);
    end


end

