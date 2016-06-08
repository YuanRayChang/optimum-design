clear
clc
% Buckling
syms x1 x2 x3 s1 s2 s3 s4 s5 s6 g1 g2 g3 g4 g5 g6 u1 u2 u3 u4 u5 u6 v1 I L dL f  % x1=ri,x2=ro,x3=l
I = pi/32*(x2^4-x1^4); 
E = 18*10^9*10^-6;
R_u=9.934;
R_l=6.129;
l_u=282.91;
l_l=211.61;
V_u=47.76*(10^3);
V_l=35.14*(10^3);
ratio=0.61;
A=pi*(x2^2-x1^2);
f = -(4*pi^2*E*I)/(x3^2)*A ;
g1 = x2-R_u;
g2 = -x2+R_l;
    g3 = x3-l_u;
    g4 = -x3+l_l;
g5 = pi*(x2^2-x1^2)*x3-V_u;
g6 = -pi*(x2^2-x1^2)*x3+V_l;
h1 = x1/x2-ratio;

L = f + u1*(g1+s1^2) + u2*(g2+s2^2) + u3*(g3+s3^2) + u4*(g4+s4^2) ...
    +u5*(g5+s5^2) + u6*(g6+s6^2) + v1*h1;
dLdx =gradient(L,[x1 x2 x3]);
dLdu=gradient(L,[u1 u2 u3 u4 u5 u6 v1]);
dLds=gradient(L,[s1 s2 s3 s4 s5 s6]);
[s1,s2,s3,s4,s5,s6,u1,u2,u3,u4,u5,u6,v1,x1,x2,x3] = solve(dLdx(1)==0,dLdx(2)==0,dLdx(3)==0,dLdu(1)==0,dLdu(2)==0,dLdu(3)==0,dLdu(4)==0,dLdu(5)==0,dLdu(6)==0,dLdu(7)==0,...
    dLds(1)==0,dLds(2)==0,dLds(3)==0,dLds(4)==0,dLds(5)==0,dLds(6)==0);
i=1;k=1;
for j=1:size(s1,1)
    if isreal(s1(j))&&isreal(s2(j))&&isreal(s3(j))&&isreal(s4(j))&&isreal(s5(j))&&isreal(s6(j))...
            &&isreal(u1(j))&&isreal(u2(j))&&isreal(u3(j))&&isreal(u4(j))&&isreal(u5(j))&&isreal(u6(j))...
            &&isreal(v1(j))&&isreal(x1(j))&&isreal(x2(j))&&isreal(x3(j))...
            &&x1(j)>0&&x2(j)>0&&x3(j)>0&&...
            u1(j)>=0&& u2(j)>=0&& u3(j)>=0&& u4(j)>=0&& u5(j)>=0&& u6(j)>=0
        
        M(i,:)=[s1(j),s2(j),s3(j),s4(j),s5(j),s6(j),u1(j),u2(j),u3(j),u4(j),u5(j),u6(j),v1(j),x1(j),x2(j),x3(j)];
        i=i+1;
    end
    k=k+1;
end
fprintf('R = %d, r= %d, l= %d\n',double(M(1,15)),double(M(1,14)),double(M(1,16)))
