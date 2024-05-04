function [Q_num, x]=sym2num_str(Q,x)

% input:
% Q: n*1 sym vector, newton poly;
% x: n*1 sym vector, unknowns;
% 
% output:
% Q_num: n*1 cell, char array;
% x: n*1 sym vector, unknowns;

[n, ~] = size(x);

Q_num = cell(n,1);
% convert each poly
for i = 1:n
   qi = Q(i,1);
   [C,T] = coeffs(qi,x);
   [~,len] = size(C);
   C_double = double(C);
   q = strcat(num2str(C_double(1,1),'%.8f'),'*',char(T(1,1)));
   
   % cat str
   for j = 2:len-1
       if num2str(C_double(1,j))>0
           q = strcat(q,'+',num2str(C_double(1,j),'%.8f'),'*',char(T(1,j)));
       else
           q = strcat(q,num2str(C_double(1,j),'%.8f'),'*',char(T(1,j)));
       end
   end
   if num2str(C_double(1,len))>0
       q = strcat(q,'+',num2str(C_double(1,len),'%.8f'));
   else
       q = strcat(q,num2str(C_double(1,len),'%.8f'));
   end
   Q_num{i,1} = q;
      
    
end


end