function avg_ma = cutter_avg_ma(theta2_s)
%% Description
% Author: Yuan-Ray Chang
% Date: 04/18/2016
% Input:
% theta2_s is the start angle of the handle 
% Output:
% avg_ma is the average mechanical advantage throughout the motion that cuts down
% 12 mm 
%=============================================================
%%
global link2 link3 offset degree_f degree_s 
degree_s=[]; % save start angle of theta2
degree_f=[]; % save final angle of theta2
avg_ma=[];
j=1;

for i=1:length(theta2_s);
theta3_s=acos((link2*cos(theta2_s(i)*pi/180)+offset)/link3);
if i~=length(theta2_s)
theta3_sp1=acos((link2*cos(theta2_s(i+1)*pi/180)+offset)/link3); % next angle of theta3
 y_sp1=link3*sin(theta3_sp1)-link2*sin(theta2_s(i+1)*pi/180); % next y position 
else
    theta3_sp1=theta3_s; % at the last angle, pretend there is no next angle 
    y_sp1=y_s;
end
if isreal(theta3_s)==1 % make sure theta3_s is a real number
    y_s=link3*sin(theta3_s)-link2*sin(theta2_s(i)*pi/180); % start position of y
    y_f=y_s+12; % final position of y
    theta2_f= handlePosition(y_f); % final angle of theta2
    %theta3_f=acos((link2*cos(theta2_f*pi/180)+offset)/link3); % final angle of theta3
    
    % 1.theta2_f must be a real number 
    % 2.the rotation of theta2 must be counter-clockwise 
    % 3. y in next angle must be larger than the initial y
    if isreal(theta2_f)==1 &&   y_sp1>=y_s %theta3_f>theta3_s && theta2_f>theta2_s(i) &&
        degree_s(j)=theta2_s(i);
        degree_f(j)=theta2_f;
        j=j+1;
    end
    end

end

for i=1:length(degree_s)
    
    deg=linspace(degree_s(i),degree_f(i),1000); % degrees that theta2 travels
        ma = cutter_ma(deg);
        avg_ma(i)=mean(ma);
        
end

end