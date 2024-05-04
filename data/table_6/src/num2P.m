
function [P, x] = num2P (Q_num, x)
% input:
% Q: n*1 cell, num poly str;
% x: unknowns;
% 
% output:
% P:  char array

[n, ~] = size(x);
P = '{';
for i = 1:n
   P = strcat(P,char(Q_num(i,1)),';');
   
end
   P = strcat(P,'}');
end



