function resenje = iter(f,g,x0,tol)


F = [sym(' x+3*log(x)-y^2') ; sym('2*x^2-x*y-5*x+1')]
J= [diff(F,'x') diff(F,'y')];
J = matlabFunction(inv(J));
F = matlabFunction(F);

x=x0;

while 1
    xp = x;
    
    x = xp - J(xp(1),xp(2))*F(xp(1),xp(2));
    
   if norm(x-xp,inf)<tol
       resenje = x;
       F(x(1),x(2))
       break;

end


end