function S = extract_cell(rootcell, I,n)
% input:
% rootcell: answer cell by homotopy method;
% I: int, number of roots;
% n: int, number of unknows;
% output:
% S: n*I matrix, solution;


S = zeros(n,I);
for i = 1:I
   S(:,i) = rootcell{i,1};
      
end

end