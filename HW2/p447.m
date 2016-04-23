% 機械四 張元睿 E14013344
clear
clc
syms x1 x2 x3 v1 v2 v3
f=(x1-1)^2+(x2+2)^2+(x3-2)^2;   % objective function
h=[x1+x2+2*x3-4,2*x1+3*x2-1];   % constrain function

sol = l_solver(f,h,3,2);    % l_sover

% Display result in sol
disp('Test P4.47 result:')
var = fieldnames(sol);
for i = 1:size(var)
    tmp = getfield(sol,var{i});
    fprintf('%6s = %6s = %10f\n',char(var(i)), char(tmp),double(tmp))
end
% calculate the value of objective funtion at the optimum point
X1=double(sol.x1);
X2=double(sol.x2);
X3=double(sol.x3);
f_value=(X1-1)^2+(X2+2)^2+(X3-2)^2;
fprintf('f ( %f , %f , %f ) = %f\n',X1,X2,X3,f_value);
fprintf('\r\n')
