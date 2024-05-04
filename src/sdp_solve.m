function [x_sdp, M_s, M] = sdp_solve(x,K,t)
% input:
% x: unknown variables
% K: constrain support vector;
% t: relaxation order;
% output:
% x_sdp: n*1 vector, solution by sdp;
% M_s: svd core of M;

[n, ~] = size(x);

% construct objective function
g0 = obj_poly(x,t);

% solve moment problem
M = moment_solve(x,K,t);

% extract solution
[x_sdp,M_s] = extract_solve(M,n);


end



function g0 = obj_poly(x,t)
% input:
% x: unknown variables;
% t: int, relaxation order;
% output:
% g0 : objective polynomial


monomials = mmon(x, t);
g0 = sum (monomials.^2);

end

function M = moment_solve(x,K,t)
% input:
% x: unknown variables
% K: constrain support vector;
% t: relaxation order;
% output:
% M: moment matrix;

% objective function
g0 = obj_poly(x,t);

% sdp problem
P = msdp(min(g0), K, t);

% solve sdp problem
[status,obj]=msol(P);

% compute moment matrix
mu = meas;
M = double(mmat(mu));

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




