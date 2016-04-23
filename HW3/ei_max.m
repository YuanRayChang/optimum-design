function [ymax,xmax] = ei_max(func_name,lb,ub,tolerance,delta,r)
%% Description
% Author: Yuan-Ray Chang
% Date: 04/18/2016
% Input:
% func_name is the name of the function m-file that you are going to evaluate.
% ub and lb define the range of the handle (start) angle
% tolerance indicate the amount of error that is acceptable
% delta is the interval for the initial bracketing
% r is a small value (<< 1) for the phase II search
% Output:
% xmax is the angle of handle
% ymax is the MA at that angle
%=============================================================
%%

global iteration_ei % count the interation times of this method

interval=10; % initialize interval, the value has to be larger than tolerance
trigger=0;
% search in the interval obtained, find out the interval that is smaller
% than tolerance 
while interval>tolerance
    iteration_ei=iteration_ei+1;
for i=lb:delta:(ub-delta)
if func_name(i)>func_name(i+delta)
     
    lb=i-delta;
    ub=i+delta;
    interval=2*delta;
    delta=r*delta;
    trigger=trigger+1;
   break
end
   
end
if trigger==0  %% if never trigger ----> func_name(i)>func_name(i+delta)
    break
end
end

xmax=(lb+ub)/2;

if trigger==0
    xmax=ub;
end
ymax=func_name(xmax);
    

end
   
        
        
    
    
        
                