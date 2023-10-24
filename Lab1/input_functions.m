% Declare the variable and the functions to get their plots and confirm
% they are quasi-convex functions
syms x
f1 = (x-2)^2 + x*log(x+3);
figure("Name","f1")
fplot(f1,[-1 3])
f2 = 5^x + (2-cos(x))^2;
figure("Name","f2")
fplot(f2,[-1 3])
f3 = exp(x) * (x^3 - 1) + (x-1)*sin(x);
figure("Name","f3")
fplot(f3, [-1 3])
