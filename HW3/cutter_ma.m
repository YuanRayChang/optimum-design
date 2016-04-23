function ma = cutter_ma(theta2)
%% Description
% Author: Yuan-Ray Chang
% Date: 04/18/2016
% Input:
% theta2 is the angle of the handle 
% Output:
% ma is mechanical advantage
%=============================================================
%%
global link2 link3 offset degree
rin=175+90*cos(40*pi/180);
j=1;
degree=[]; % saves the angle of theta2 
for i=1:length(theta2);
theta3=acos((link2*cos(theta2(i)*pi/180)+offset)/link3);
if isreal(theta3)==1  % make sure theta3 is real number
    
    y=link3*sin(theta3)-link2*sin(theta2(i)*pi/180);
    ma_temp=rin/(offset-y/tan(theta3));
    if ma_temp>=0 % make sure MA is larger than 0
    ma(j)=ma_temp;
    degree(j)=theta2(i);
     j=j+1;
    end
       
end

end

end