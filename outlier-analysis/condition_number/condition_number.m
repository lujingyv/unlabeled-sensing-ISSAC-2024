trial = 20;
n = 4;
m = 50;
condition_list = zeros(trial,1);

for i = 1: trial
    A = randn(m,n);
    cond_A = cond(A);
    condition_list(i,1) = cond_A;    
end


xlswrite('cond.xlsx',condition_list,1);