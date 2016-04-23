% 機械四 張元睿 E14013344
clear
clc
syms x1 x2 x3 v1
f=4*x1^2+3*x2^2-5*x1*x2-8*x1;   % objective function
h=x1+x2-4;  % constrain function
sol = l_solver(f,h,2,1);    % l_sover

% Display result in sol
disp('Test P4.44 result:')
var = fieldnames(sol);
for i = 1:size(var)
    tmp = getfield(sol,var{i});
    fprintf('%s = %s\n',char(var(i)), char(tmp))
end
fprintf('\r\n');
%%%%    to see the 3D plot    %%%%
% x1=linspace(-100,100);
% x2=linspace(-100,100);
% [X1,X2]=meshgrid(x1,x2);
% Z=4*X1.*X1+3*X2.*X2-5*X1.*X2-8.*X1;
% surf(X1,X2,Z);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(1,2,1);     % l_solver image
x1=linspace(-10,10);
x2=linspace(-10,10);
[X1,X2]=meshgrid(x1,x2);
Z=4*X1.*X1+3*X2.*X2-5*X1.*X2-8.*X1; % objective function
H=X1+X2-4;  % constrain function
cla reset
axis auto % Minimum and maximum values for axes are determined automatically
% Limits for x- and y-axes may also be specified with the command
% axis ([xmin xmax ymin ymax])
xlabel('x1'),ylabel('x2') % Specifies labels for x- and y-axes
title ('P4.44 l-solver') % Displays a title for the problem
hold on % retains the current plot and axes properties for all subsequent plots
% Use the “contour” command to plot constraint and cost functions
cv1=[-8.333 40 80]; % Specifies three contour values, -8.333, 40, 80
const1=contour(X1,X2,Z,cv1,'k'); %Plots three specified contours of Z; k=black color
clabel(const1);  % Automatically puts the contour value on the graph
text(13/6,11/6,'minimum point');    % point out the minimum point
hold on;
cv2=[0 0]; % Specifies one contour of value 0
const2=contour(X1,X2,H,cv2,'g');  % Plots two specified contours of H; g=green color
clabel(const2);
legend('f','constrain');

subplot(1,2,2);     % graphical solution
[X1,X2]=meshgrid(x1,x2);
Z=4*X1.*X1+3*X2.*X2-5*X1.*X2-8.*X1;     % objective function
H=X1+X2-4;  % constrain function
cla reset
axis auto 
xlabel('x1'),ylabel('x2') % Specifies labels for x- and y-axes
title ('P4.44 graphical') % Displays a title for the problem
hold on % retains the current plot and axes properties for all subsequent plots
% Use the “contour” command to plot constraint and cost functions
cv3=[80 160 500]; % Specifies three contour values, 80, 160, 500
const3=contour(X1,X2,Z,cv3,'k'); % Plots three specified contours of Z; k=black color
clabel(const3); % Automatically puts the contour value on the graph
cv4=[0 0]; % Specifies one contour of value 0
const4=contour(X1,X2,H,cv4,'r'); %Plots two specified contours of H; r=red color
clabel(const4); %Automatically puts the contour value on the graph