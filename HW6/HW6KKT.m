clear
clc
% Buckling
syms x1 x2 x3 s1 s2  g1 g2  u1 u2  I L dL f  % x1=ri,x2=ro,x3=l
f=3*x1^2+2*x2^2+5*x3^2-4*x1*x2-2*x1*x3-2*x2*x3;
g1 =-3*x1-5*x2-2*x3+10;
g2 = 3*x1+5*x3-15;

L = f + u1*(g1+s1^2) + u2*(g2+s2^2);
dLdx =gradient(L,[x1 x2 x3]);
dLdu=gradient(L,[u1 u2]);
dLds=gradient(L,[s1 s2]);
[s1,s2,u1,u2,x1,x2,x3] = solve(dLdx(1)==0,dLdx(2)==0,dLdx(3)==0,dLdu(1)==0,dLdu(2)==0,dLds(1)==0,dLds(2)==0);
i=1;k=1;
for j=1:size(s1,1)
    if isreal(s1(j))&&isreal(s2(j))&&isreal(u1(j))&&isreal(u2(j))&&isreal(x1(j))&&isreal(x2(j))&&isreal(x3(j))...
            &&x1(j)>0&&x2(j)>0&&x3(j)>0&&...
            u1(j)>=0&& u2(j)>=0
        
        M(i,:)=[s1(j),s2(j),u1(j),u2(j),x1(j),x2(j),x3(j)];
        i=i+1;
    end
    k=k+1;
end
