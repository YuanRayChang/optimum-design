% Copy this script file along with testfunc1.m and testfunc2.m to your
% program folder and run it.
% The script will call your gs_max and test it with two test functions
% You can replace gs_max() with ei_max() or aei_max() to test them.
% Modify input arguments if needed.
clear 
clc
close all
fig1 = figure('Name','test gs_max');
global count
% We want to find the maximum value of f(x) in x = 0 - 10
lb = -10; 
ub = 10; 
delta = 0.5; % search interval for the initial breacketing
tor = 0.0001; % tolerance of error
r=0.01;
% Generate x data point for plots
x = linspace(-10,10,1000);

% Try test function 1
subplot(1,2,1)
plot(x,testfunc1(x));
hold on
[ymax1,xmax1] = gs_max(@testfunc1,lb,ub,tor,delta);
plot(xmax1,ymax1, 'r-o')
hold off

% Try test function 2
subplot(1,2,2);
plot(x,testfunc2(x));
hold on
[ymax2,xmax2] = gs_max(@testfunc2,lb,ub,tor,delta);
plot(xmax2,ymax2, 'r-o')
hold off
%%
fig2 = figure('Name','test ei_max');

% We want to find the maximum value of f(x) in x = 0 - 10
lb = -10; 
ub = 10; 
delta = 0.5; % search interval for the initial breacketing
tor = 0.0001; % tolerance of error
r=0.01;
% Generate x data point for plots
x = linspace(-10,10,1000);

% Try test function 1
subplot(1,2,1)
plot(x,testfunc1(x));
hold on
[ymax1,xmax1] = ei_max(@testfunc1,lb,ub,tor,delta,r);
plot(xmax1,ymax1, 'r-o')
hold off

% Try test function 2
subplot(1,2,2);
plot(x,testfunc2(x));
hold on
[ymax2,xmax2] = ei_max(@testfunc2,lb,ub,tor,delta,r);
plot(xmax2,ymax2, 'r-o')
hold off
%%
fig3 = figure('Name','test aei_max');
% We want to find the maximum value of f(x) in x = 0 - 10
lb = -10; 
ub = 10; 
delta = 0.5; % search interval for the initial breacketing
tor = 0.0001; % tolerance of error
r=0.01;
% Generate x data point for plots
x = linspace(-10,10,1000);

% Try test function 1
subplot(1,2,1)
plot(x,testfunc1(x));
hold on
[ymax1,xmax1] = aei_max(@testfunc1,lb,ub,tor,delta);
plot(xmax1,ymax1, 'r-o')
hold off

% Try test function 2
subplot(1,2,2);
plot(x,testfunc2(x));
hold on
[ymax2,xmax2] = aei_max(@testfunc2,lb,ub,tor,delta);
plot(xmax2,ymax2, 'r-o')
hold off