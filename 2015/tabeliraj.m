function T = tabeliraj(f,a,b,n)

syms x;
F = sym(f);
F1 = matlabFunction(diff(F,'x'));

X = linspace(a,b,n)'

T = [X, f(X), F1(X)];






end