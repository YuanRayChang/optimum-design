clear
clc
syms x1 x2 x3;
f=3*x1^2+2*x2^2+5*x3^2-4*x1*x2-2*x1*x3-2*x2*x3;

fprintf('q(x) = cT*X + 0.5*XT*H*X \n');
fprintf('AT*X <= b \n\n');
fprintf('c = \n');
fprintf('[ 0\n  0\n  0 ]\n\n');
fprintf('H = \n');
fprintf('[ 6 -4 -2\n  -4 4 -2\n  -2 -2 10 ]\n\n');
fprintf('X = \n');
fprintf('[ x1\n  x2\n  x3 ]\n\n');
fprintf('AT = \n');
fprintf('[ -3 -5 -2\n  3  0  5 ]\n\n');
fprintf('b = \n');
fprintf('[ -10\n  15 ]\n\n');
fprintf('L = 0.5*XT*H*X + uT*(AT*X+s-b) - {T*X \n');
fprintf('KKT condition :\n');
fprintf('1. dL/dx = H*X + Au - { = 0  \n');
fprintf('2. AT*X+s-b = 0  \n');
fprintf('3. ui*si = 0; i= 1 to 2   \n');
fprintf('4. {i*xi = 0; i= 1 to 3   \n');
fprintf('5. ui, si >= 0; i= 1 to 2   \n');
fprintf('6. {i, xi >= 0; i= 1 to 3   \n\n');
fprintf('BX = D : \n');
B=[6 -4 -2 -3 3 -1 0 0 0 0;-4 4 -2 -5 0 0 -1 0 0 0;-2 -2 10 -2 5 0 0 -1 0 0; ...
    -3 -5 -2 0 0 0 0 0 1 0;3 0 5 0 0 0 0 0 0 1]
fprintf('X = [ x1\n\t  x2\n\t  x3\n\t  u1\n\t  u2\n\t  {1\n\t  {2\n\t  {3\n\t  s1\n\t  s2 ]\n\n');
D=[0;0;0;-10;15]
syms w
W=[0 7 -9 10 -8 1 1 1 -1 -1 0 0 0 0 0 -5];
tableau=[B eye(5) D;W];
initial_tableau=dataset({tableau 'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','Y1','Y2','Y3','Y4','Y5','D'}, ...
                'obsnames',{'Y1','Y2','Y3', 'Y4','Y5','artificial'})
tableau(3,:)=tableau(3,:)/tableau(3,3);
tableau(1,:)=tableau(1,:)-tableau(1,3)*tableau(3,:);
tableau(2,:)=tableau(2,:)-tableau(2,3)*tableau(3,:);
tableau(4,:)=tableau(4,:)-tableau(4,3)*tableau(3,:);
tableau(5,:)=tableau(5,:)-tableau(5,3)*tableau(3,:);
tableau(6,:)=tableau(6,:)-tableau(6,3)*tableau(3,:);
second_tableau=dataset({tableau 'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','Y1','Y2','Y3','Y4','Y5','D'}, ...
                'obsnames',{'Y1','Y2','X3', 'Y4','Y5','artificial'})
tableau(2,:)=tableau(2,:)/tableau(2,5);
tableau(1,:)=tableau(1,:)-tableau(1,5)*tableau(2,:);
tableau(3,:)=tableau(3,:)-tableau(3,5)*tableau(2,:);
tableau(4,:)=tableau(4,:)-tableau(4,5)*tableau(2,:);
tableau(5,:)=tableau(5,:)-tableau(5,5)*tableau(2,:);
tableau(6,:)=tableau(6,:)-tableau(6,5)*tableau(2,:);           
third_tableau=dataset({tableau 'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','Y1','Y2','Y3','Y4','Y5','D'}, ...
                'obsnames',{'Y1','X5','X3','Y4','Y5','artificial'})
tableau(1,:)=tableau(1,:)/tableau(1,1);
tableau(2,:)=tableau(2,:)-tableau(2,1)*tableau(1,:);
tableau(3,:)=tableau(3,:)-tableau(3,1)*tableau(1,:);
tableau(4,:)=tableau(4,:)-tableau(4,1)*tableau(1,:);
tableau(5,:)=tableau(5,:)-tableau(5,1)*tableau(1,:);
tableau(6,:)=tableau(6,:)-tableau(6,1)*tableau(1,:);               
fourth_tableau=dataset({tableau 'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','Y1','Y2','Y3','Y4','Y5','D'}, ...
                'obsnames',{'X1','X5','X3','Y4','Y5','artificial'}) 
tableau(4,:)=tableau(4,:)/tableau(4,9);
tableau(6,:)=tableau(6,:)-tableau(6,9)*tableau(4,:);            
fifth_tableau=dataset({tableau 'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','Y1','Y2','Y3','Y4','Y5','D'}, ...
                'obsnames',{'X1','X5','X3','X9','Y5','artificial'}) 
tableau(2,:)=tableau(2,:)/tableau(2,2);
tableau(1,:)=tableau(1,:)-tableau(1,2)*tableau(2,:);
tableau(3,:)=tableau(3,:)-tableau(3,2)*tableau(2,:);
tableau(4,:)=tableau(4,:)-tableau(4,2)*tableau(2,:);
tableau(5,:)=tableau(5,:)-tableau(5,2)*tableau(2,:);
tableau(6,:)=tableau(6,:)-tableau(6,2)*tableau(2,:);  
sixth_tableau=dataset({tableau 'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','Y1','Y2','Y3','Y4','Y5','D'}, ...
                'obsnames',{'X1','X2','X3','X9','Y5','artificial'}) 
tableau(4,:)=tableau(4,:)/tableau(4,4);
tableau(1,:)=tableau(1,:)-tableau(1,4)*tableau(4,:);
tableau(2,:)=tableau(2,:)-tableau(2,4)*tableau(4,:);
tableau(3,:)=tableau(3,:)-tableau(3,4)*tableau(4,:);
tableau(5,:)=tableau(5,:)-tableau(5,4)*tableau(4,:);
tableau(6,:)=tableau(6,:)-tableau(6,4)*tableau(4,:);
tableau(6,:)=tableau(6,:)-tableau(6,4)*tableau(4,:);
seventh_tableau=dataset({tableau 'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','Y1','Y2','Y3','Y4','Y5','D'}, ...
                'obsnames',{'X1','X2','X3','X4','Y5','artificial'}) 
tableau(5,:)=tableau(5,:)/tableau(5,10);
tableau(6,:)=tableau(6,:)-tableau(6,10)*tableau(5,:);
final_tableau=dataset({tableau 'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','Y1','Y2','Y3','Y4','Y5','D'}, ...
                'obsnames',{'X1','X2','X3','X4','X10','artificial'}) 
dataset({tableau 'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','Y1','Y2','Y3','Y4','Y5','D'}, ...
                'obsnames',{'Y1','Y2','Y3','Y4','Y5','artificial'});

fprintf('the optimum solution is (x1, x2, x3) = (0.98146, 1.2323, 0.44711)\n');
fprintf('f = 0.1091\n');