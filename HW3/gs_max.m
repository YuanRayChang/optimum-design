function [ymax, xmax] = gs_max(func_name, lb, ub, tolerance, delta)
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
global iteration_gs   %count the interation times of this method
% calculate alpha 
function x=index(n)
x=0;
for i=0:n
    x=x+((sqrt(5)+1)/2).^i;
end
end
% search for the point that has larger value than neighbors
for j=0:1:(ub-lb)/delta
    if func_name(lb+delta*index(j+1))>func_name(lb+delta*index(j)) && func_name(lb+delta*index(j+2))<func_name(lb+delta*index(j+1))
         ub=lb+delta*index(j+2);
         lb=lb+delta*index(j);
        break
    end
end

interval=ub-lb;
alpha_b=lb+(sqrt(5)-1)/2*interval; % (sqrt(5)-1)/2 ==> 1-(sqrt(5)+1)/2
alpha_a=lb+(3-sqrt(5))/2*interval; % (3-sqrt(5))/2 ==> 1-(sqrt(5)-1)/2
    
% search in the interval obtained, find out the interval that is smaller
% than tolerance 
while interval>tolerance
    iteration_gs=iteration_gs+1;
    if func_name(alpha_a)>func_name(alpha_b)
        ub=alpha_b;
        alpha_b=alpha_a;
        alpha_a=lb+(3-sqrt(5))/2*(ub-lb);   
        interval=ub-lb;
    elseif func_name(alpha_a)<func_name(alpha_b)
         lb=alpha_a;
         alpha_a=alpha_b;
         alpha_b=lb+(sqrt(5)-1)/2*(ub-lb);
         interval=ub-lb;
    else
        lb=alpha_a;
        ub=alpha_b;
        interval=ub-lb;
        alpha_b=lb+(sqrt(5)-1)/2*interval;
        alpha_a=lb+(3-sqrt(5))/2*interval;
    end
    
end

    
xmax=(lb+ub)/2;
ymax=func_name(xmax);


end
   
        
        
    
    
        
                