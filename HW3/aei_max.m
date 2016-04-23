function [ymax, xmax] = aei_max(func_name, lb, ub, tolerance, delta)
%% Description
% Author: Yuan-Ray Chang
% Date: 04/18/2016
% Input:
% func_name is the name of the function m-file that you are going to evaluate.
% ub and lb define the range of the handle (start) angle
% tolerance indicate the amount of error that is acceptable
% delta is the interval for the initial bracketing
% Output:
% xmax is the angle of handle
% ymax is the MA at that angle
%=============================================================
%%
interval=10; % initialize interval, the value has to be larger than tolerance
global iteration_aei  %count the interation times of this method
trigger=0;
% search for the point that has larger value than the next point
for i=lb:delta:ub-delta
if func_name(i)>func_name(i+delta)
     
    lb=i-delta;
    ub=i+delta;
    alpha_a=lb+2/3*delta;
    alpha_b=lb+4/3*delta;
    trigger=trigger+1;
     break
end
end

if trigger==0       %% if never trigger ----> func_name(i)>func_name(i+delta)
    alpha_a=lb+2/3*delta;
    alpha_b=lb+4/3*delta;
end
% search in the interval obtained, find out the interval that is smaller
% than tolerance 
while interval>tolerance
    iteration_aei=iteration_aei+1;
    if func_name(alpha_a)>func_name(alpha_b)
        ub=alpha_b;
    else
        lb=alpha_a;
    end
    interval=ub-lb;
    alpha_a=lb+1/3*interval;
    alpha_b=lb+2/3*interval;
end

xmax=(lb+ub)/2;
ymax=func_name(xmax);
    
end
   
        
        
    
    
        
                