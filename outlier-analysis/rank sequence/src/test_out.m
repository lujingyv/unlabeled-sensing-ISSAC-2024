function [Error_EM, Error_sdp_ref, Time]=test_out(m,n,t,sigma,trail,T, epsilon)

% input:
% m: int;
% n: int;
% t: int, relaxation order;
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
Error_sdp_ref = zeros(trail, 1);
Time = zeros(trail, 1);
file_name = 'log<i>.xlsx';
placeholder = '<i>';



% loop counter
i = 1;
while i<= trail
   try      
       [ x_real, x_EM, x_nref,Error_EM(i,1), Error_sdp_ref(i,1), Time(i,1), A, y_pure, y, M_s, M, noise]=test_once_out(m,n,t,sigma,T, epsilon);
       noise_norm = norm(noise);
       noise_ratio = noise_norm/norm(y);
       
       file_name_i = replace(file_name,placeholder,int2str(i));
       xlswrite(file_name_i,A,'A');
       xlswrite(file_name_i,x_real,'x_real');
       xlswrite(file_name_i,x_EM,'x_EM');
       xlswrite(file_name_i,x_nref,'x_nref');
       xlswrite(file_name_i, y_pure,'y_pure');
       xlswrite(file_name_i, y,'y');
       xlswrite(file_name_i, M_s,'M_s');
       xlswrite(file_name_i, M,'M');
       xlswrite(file_name_i, noise,'noise');
       xlswrite(file_name_i, noise_norm,'noise_norm');
       xlswrite(file_name_i, noise_ratio,'noise_ratio');
       
       xlswrite(file_name_i, Error_EM(i,1),'err_EM');
       xlswrite(file_name_i, Error_sdp_ref(i,1),'err_sdp');
       xlswrite(file_name_i, Time(i,1),'time');

       
       
   catch
       continue;
   end
       i = i + 1; 
end

end
