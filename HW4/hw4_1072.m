clear
clc
syms x1 x2 x3 alpha
f(x1,x2,x3)=x1^2+2*x2^2+2*x3^2+2*x1*x2+2*x2*x3;
k=0;
x1=1;
x2=1;
x3=1;
epsilon=0.0001;
c=gradient(f);
c_value=c(x1,x2,x3);
c_length=sqrt(c_value(1)^2+c_value(2)^2+c_value(3)^2);
d=-c_value;
f_alpha(alpha)=f(x1+d(1)*alpha,x2+d(2)*alpha,x3+d(3)*alpha);
df_alpha(alpha)=diff(f_alpha);
alpha=solve(df_alpha);

x_0=double([x1 x2 x3]);
c_0=double([c_value(1) c_value(2) c_value(3)]);
c_0a=double(c_length);
d_0=double(-c_0);
alpha_0=double(alpha);
x1=x1+d(1)*alpha;
x1=round(x1*10^8)/10^8;
x2=x2+d(2)*alpha;
x2=round(x2*10^8)/10^8;
x3=x3+d(3)*alpha;
x3=round(x3*10^8)/10^8;

while true
c_value=c(x1,x2,x3);
c_length_new=sqrt(c_value(1)^2+c_value(2)^2+c_value(3)^2);
if c_length > epsilon
    syms alpha 
    beta=(c_length_new/c_length)^2;
    d_new=-c_value+beta*d;
    f_alpha(alpha)=f(x1+d_new(1)*alpha,x2+d_new(2)*alpha,x3+d_new(3)*alpha);
    df_alpha(alpha)=diff(f_alpha);
    alpha=solve(df_alpha);
    
    if k==0
        x_1=double([x1 x2 x3]);
        c_1=double([c_value(1) c_value(2) c_value(3)]);
        c_1a=double(c_length_new);
        d_1=double(d_new);
        alpha_1=double(alpha);
    end
    x1=x1+d_new(1)*alpha;
    x1=round(x1*10^8)/10^8;
    x2=x2+d_new(2)*alpha;
    x2=round(x2*10^8)/10^8;
    x3=x3+d_new(3)*alpha;
    x3=round(x3*10^8)/10^8;
    c_length=c_length_new;
    d=d_new;
    k=k+1;
else
    break;
end

end


fprintf('problem 10.72 :\n');
fprintf('================ part1 ================\n');
fprintf('first iteration : k=0\n');
fprintf('x(0) : ( %d, %d, %d )\n',x_0(1),x_0(2),x_0(3));
fprintf('c(0) : ( %d, %d, %d )\n',c_0(1),c_0(2),c_0(3));
fprintf('Absolute value of c(0) : %d\n',c_0a);
fprintf('d(0) : ( %d, %d, %d )\n',d_0(1),d_0(2),d_0(3));
fprintf('alpha(0) : %d\n',alpha_0);
fprintf('\n');
fprintf('second iteration : k=1\n');
fprintf('x(1) : ( %d, %d, %d )\n',x_1(1),x_1(2),x_1(3));
fprintf('c(1) : ( %d, %d, %d )\n',c_1(1),c_1(2),c_1(3));
fprintf('Absolute value of c(1) : %d\n',c_1a);
fprintf('d(1) : ( %d, %d, %d )\n',d_1(1),d_1(2),d_1(3));
fprintf('alpha(1) : %d\n',alpha_1);
fprintf('================ part1 ================\n');
fprintf('\n');
fprintf('================ part2 ================\n');
fprintf('Optimum design point (x1* , x2* , x3* ) : ( %d, %d, %d )\n',double(x1),double(x2),double(x3)');
fprintf('Optimum cost function value : %d)\n',double(f(x1,x2,x3)));
fprintf('Gradient of f(x) at the optimum point : ( %d, %d, %d )\n',double(c_value(1)),double(c_value(2)),double(c_value(3)));
fprintf('Number of iterations : %d\n',k);
fprintf('================ part2 ================\n');
