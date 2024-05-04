function [x,Pi] = SLR_hardEM(A,y,X_0,T,epsilon)

% Implements the Hard EM algorithm described in Abid et al., arXiv 2018,
% for solving the Shuffled Linear Regression (SLR) problem (A,y).

% INPUT
% A: m x n coefficient matrix
% y: m x 1 vector of observations
% X_0: matrix of size n x I, each column is a different initialization
% T: number of iterations
% epsilon: termination precision of the EM algorithm
% verbose: output additional information if verbose is true.

% OUTPUT
% x: n x 1 solution to the SLR problem
% Pi: corresponding permutation that matches rows of A to y (applied on A)

% initializations
[m, n] = size(A);
[~, I] = size(X_0);
X = X_0;
J = inf;
tt = 0;
% Identity = eye(m);

% sort y in ascending order
y_sorted = sort(y,1);

while (tt <= T) & (J >= epsilon)
    tt = tt+1;

    % update Y_hat
    Y_hat = A * X;

    % sort Y_hat(:,j) in ascending order
    [Y_hat_sorted, Pi_I] = sort(Y_hat, 1);

    % compute error
    e = norm(y_sorted*ones(1,I) - Y_hat_sorted);
    [J,Pi_index] = min(e);

    Pi = 0;
    % Pi = Identity(Pi_I(:,Pi_index),:);

    x = X(:,Pi_index);

    % update X
    for j = 1 : I
        % get least squares solution with permuted A
        X(:, j) = A(Pi_I(:,j),:) \ y_sorted;
    end
    
end


end
