function zad3()

tol = 1e-4;

F = [sym('x*exp(x)-y-2'); sym('y^2-x^2-0.5')];

x0 = [1 1]';

newton(F,x0,tol)

modNewton(F,x0,tol)




end