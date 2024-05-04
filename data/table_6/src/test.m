function [Error_EM, Error_homo, Time_EM,Time_homo,nroot]=test(m,n,sigma,trail,T, epsilon)

% input:
% m: int;
% n: int;
% sigma: float, noise standard deviation;
% trail: int, number of trails
% T: int, maxiamal iteration in EM;
% epsilon: float, accuracy in EM;
% 
% output:
% Error_EM: trail*1 vector, relative error after refinement;
% Error_sdp: trail*1 vector, relative error of sdp method;
% Time: trail*1 vector, cputime;

% initialization
Error_EM = zeros(trail,1);
Error_homo = zeros(trail, 1);
Time_homo = zeros(trail, 1);
Time_EM = zeros(trail,1);
nroot = zeros(trail,1);


% loop counter
i = 1;
while i<= trail
   try      
       [~,~,~,Error_EM(i,1),Error_homo(i,1),Time_EM(i,1), Time_homo(i,1),nroot(i,1)] = test_once(m,n,sigma,T, epsilon); 
       %[x_real, x_EM, x_homo,error_EM, error_homo, time_EM,time_homo,I]=test_once(m,n,sigma,T, epsilon)
   catch
       continue;
   end
       i = i + 1; 
end

end

