% 機械四  張元睿  E14013344
clear
clc
%Create a grid from 0.02 to 0.5 with an increment of 0.0002 for the variable x1 
%and from 0.6 to 1 with an increment of 0.0002 for variable x2
[x1,x2]=meshgrid(0.02:0.0002:0.5,0.6:0.0002:1);
%properties of material 1 and material 3
rho1=7850;%density (kg/m^3)
rho2=1800;
tau_allow1=275*10^6;%shear stress allowable (pa)
tau_allow2=90*10^6;
E1=210*10^9;%elastic modulus (pa)
E2=45*10^9;
G1=80*10^9;%shear modulus (pa)
G2=16*10^9;
pr1=0.3;%poisson ratio
pr2=0.35;
%properties of rod2
length=0.75;%rod length (m)
T0=15*10^3;%normal torque (N*m)
Tmax=25*10^3;%maximun torque (N*m)
theda_allow=2*pi/180;%allowable twist angle (radius)
%Enter functions for the weight minimization problem
J=pi/32*(x1.^4-(x1.*x2).^4);%polar moment of inertia (m^4)
c=x1/2;%distance from rod axis to extreme fiber (m)
f1=pi/4*rho1*length*(x1.*x1-x1.*x1.*x2.*x2);%function of Mass
g1=c./J*T0-tau_allow1;%shear stress constraint
g2=length/G1./J*T0-theda_allow;%twist angle constraint
g3=pi*E1*x1.^3./(12*sqrt(2)*(1-pr1.^2)^0.75).*(1-x2).^2.5-Tmax;%buckle constraint
%Initialization statements; these need not end with a semicolon
figure(1)  %for material 1
cla reset
axis auto %Minimum and maximum values for axes are determined automatically
%Limits for x- and y-axes may also be specified with the command
%axis ([xmin xmax ymin ymax])
xlabel('x1=do (m)'),ylabel('x2=di/do') %Specifies labels for x- and y-axes
title ('weight minimization problem using material 1') %Displays a title for the problem
hold on %retains the current plot and axes properties for all subsequent plots
%Use the “contour” command to plot constraint and cost functions
cv1=[-2*10^8 0]; %Specifies two contour values, 0 and -2*10^8
const1=contour(x1,x2,g1,cv1,'k'); %Plots two specified contours of g1; k=black color
clabel(const1) %Automatically puts the contour value on the graph
cv2=[-0.03 0];
const2=contour(x1,x2,g2,cv2,'*b');
clabel(const2)
cv3=[-2500 0];
const3=contour(x1,x2,g3,cv3,'--dc');
clabel(const3)
fv=[1.8 1.7 1.65 1.6]; %Defines 4 contours for the profit function
fs=contour(x1,x2,f1,fv,'y'); 
clabel(fs)
hold off %Indicates end of this plotting sequence
%Subsequent plots will appear in separate windows
figure(2) %for material 3
cla reset
axis auto %Minimum and maximum values for axes are determined automatically
%Limits for x- and y-axes may also be specified with the command
%axis ([xmin xmax ymin ymax])
xlabel('x1=do (m)'),ylabel('x2=di/do') %Specifies labels for x- and y-axes
title ('weight minimization problem using material 3') %Displays a title for the problem
hold on
f2=pi/4*rho2*length*(x1.*x1-x1.*x1.*x2.*x2);
g4=c./J*T0-tau_allow2; %shear stress constraint
g5=length/G2./J*T0-theda_allow; %twist angle constraint
g6=pi*E2*x1.^3./(12*sqrt(2)*(1-pr2.^2)^0.75).*(1-x2).^2.5-Tmax; %buckle constraint
cv4=[-10^7 0]; %Specifies two contour values, 0 and -10^7
const4=contour(x1,x2,g4,cv4,'k'); %Plots two specified contours of g1; k=black color
clabel(const4) %Automatically puts the contour value on the graph
cv5=[200 0];
const5=contour(x1,x2,g5,cv5,'*b');
clabel(const5)
cv6=[10^7 0];
const6=contour(x1,x2,g6,cv6,'--dc');
clabel(const6)
fv2=[0.91 0.92 0.93 0.94]; %Defines 4 contours for the profit function
fs2=contour(x1,x2,f2,fv2,'y'); 
clabel(fs2)
hold off 