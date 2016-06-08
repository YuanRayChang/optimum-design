function [F_buckle] = Buckling(R,L)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    E = 18*10^9;
    r = 0.61*R;     %unit mm   
    F_buckle =(E*((0.001*R).^4-(0.001*r).^4).*(pi^3))./(8.*((0.001*L).^2)) %unit N

end

