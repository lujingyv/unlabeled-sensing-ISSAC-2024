function [Error_EM, Error_sdp_ref, Time]=test(m,n,t,sigma,trail,T, epsilon)

% input:
% m: int;
% n: int;
% t: int, relaxation order;
% sigma: float, noise standard deviation;
% trial: int, number of trails
% T: int, maxiamal iteration in EM;
% epsilon: float, accuracy in EM;
% 
% output:
% Error_EM: trail*1 vector, relative error after refinement;
% Error_sdp: trail*1 vector, relative error of sdp method;
% Time: trail*1 vector, cputime;

% initialization
Error_EM = zeros(trail,1);
Error_sdp_ref = zeros(trail, 1);
Time = zeros(trail, 1);


% loop counter
i = 1;
while i<= trial
   try      
       [ ~, ~, ~,Error_EM(i,1), Error_sdp_ref(i,1), Time(i,1)] = test_once(m,n,t,sigma,T, epsilon);      
   catch
       continue;
   end
       i = i + 1; 
end

end

