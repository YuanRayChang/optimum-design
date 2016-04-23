syms x1 x2 x3 v1 v2 v3
% Test 1: Two-variable non-constrained problem: x = (1.5,1.5)
f1 = (x1-1.5)^2 + (x2-1.5)^2;
h1 = 0;
sol = l_solver(f1,h1,2,0);

% Display result in sol
disp('Test function 1 result:')

var = fieldnames(sol);
for i = 1:size(var)
    tmp = getfield(sol,var{i});
    fprintf('%s = %s\n',char(var(i)), char(tmp))
end
fprintf('\r\n')

% Test 2: Two-variable equality-constrained problem: (x,v) = (1,1,1)
f2 = (x1-1.5)^2 + (x2-1.5)^2;
h2 = x1 + x2 - 2;
sol = l_solver(f2,h2,2,1);

% Display result in sol
disp('Test function 2 result:')

var = fieldnames(sol);
for i = 1:size(var)
    tmp = getfield(sol,var{i});
    fprintf('%s = %s\n',char(var(i)), char(tmp))
end

fprintf('\r\n')

% Test 3: Three-variable non-constrained problem: x = (1, 2, 3)
f3 = (x1-1)^2 + (x2-2)^2 + (x3-3)^2;
h3 = 0;
sol = l_solver(f3,h3,3,0);

% Display result in sol
disp('Test function 3 result:')

var = fieldnames(sol);
for i = 1:size(var)
    tmp = getfield(sol,var{i});
    fprintf('%s = %s\n',char(var(i)), char(tmp))
end
fprintf('\r\n')

% Test 4: Three-variable equality-constrained problem: x = (1/2,2,3,1)
f3 = (x1-1)^2 + (x2-2)^2 + (x3-3)^2;
h3 = x1 - 0.5;
sol = l_solver(f3,h3,3,1);

% Display result in sol
disp('Test function 4 result:')

var = fieldnames(sol);
for i = 1:size(var)
    tmp = getfield(sol,var{i});
    fprintf('%s = %s\n',char(var(i)), char(tmp))
end
fprintf('\r\n')