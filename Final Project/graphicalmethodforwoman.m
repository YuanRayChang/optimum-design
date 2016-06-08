%�o�O���k�H��
clc;
clear;
close;
[R,L] = meshgrid(0:0.01:20,0:1:500);
E = 18*10^9;
r = 0.61*R;
F_buckle = (E*((0.001*R).^4-(0.001*r).^4).*(pi^3))./(8.*((0.001*L).^2));
g1 = R-5.647;
g2 = R-6.866;
g3 = L-186.8533;
g4 = L-234.8967;
g5 = (pi*((0.001*R).^2-(0.001*r).^2).*(0.001*L))-(30.77*(0.01^3));
g6 = (pi*((0.001*R).^2-(0.001*r).^2).*(0.001*L))-(21.75*(0.01^3));
xlabel('Radius of radius bone.(R)'),ylabel('Length of radius bone.(L)')
title('Graphical Method for Female.')
hold on
%�H���P�C��Ϥ����@�˩���u
cv1 = [0 0];
const1 = contour(R,L,g1,cv1,'k');%black
clabel(const1)

const1p = contour(R,L,g2,cv1,'k');%black
clabel(const1p)

const2 = contour(R,L,g3,cv1,'k');%black
clabel(const2)

const2p = contour(R,L,g4,cv1,'k');%black
clabel(const2p)

const3 = contour(R,L,g5,cv1,'g');%green
clabel(const3)

const3p = contour(R,L,g6,cv1,'g');%green
clabel(const3p)




% �e�X�ؼШ�Ƥ��P�Ȥ��ϧ�
fv = [-100 -50 -2.2566*1e5];      %���Hz=-100 -50 �F���ͶաA�A�Htry & error��X�̤p��M=-12846
fs = contour(R,L,-F_buckle,fv,'b');   %�e�X�ͶչϨåH�Ŧ���
clabel(fs)