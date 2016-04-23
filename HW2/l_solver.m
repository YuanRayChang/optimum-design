% 機械四 張元睿 E14013344
%   L_SOLVER
function [ sol ] = l_solver( f,h,nvar,ncos) 
% f:objective function, h:constrains, nvar:number of variables in objective
% function, nocs:number of constains
if ncos>0   % more than zero constrains
    v=sym('v',[1,ncos]);    % create an dynamic array eg, v1 v2 v3 ......
    L=f+dot(v,h);   % L=f+v*h
    gradL=gradient(L);  % gradient of L
    sol=solve(gradL);   % solve gradient of L
end
if ncos==0
    L=f;    % L=f+v*h, h=0, so L=f
    gradL=gradient(L);  % gradient of L
    sol=solve(gradL);   % solve gradient of L
end
end
