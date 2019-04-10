function [p1,p2,p3] = prvi(a,b,n)

f = sym('x^20');
f1 = diff(f);
f2 = diff(f,2);
f3 = diff(f,3);

F = matlabFunction(f);
F1 = matlabFunction(f1);
F2 = matlabFunction(f2);
F3 = matlabFunction(f3);

X = linspace(a,b,n);
X=X';

T1 = [X F(X) F1(X)];
T2 = [X F(X) F1(X) F2(X)];
T3 = [X F(X) F1(X) F2(X) F3(X)];


p1 = hermite(T1);
p2 = hermite(T2);
p3 = hermite(T3);

xx= linspace(a,b,1000);
plot(xx,polyval(p1,xx),xx,polyval(p2,xx),xx,polyval(p3,xx));



end