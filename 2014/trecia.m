function [X iter] = trecia(tol,x0,y0)

syms x;
syms y;

f = [y*(x-1)-1'; x^2 - y^2-1];
J = inv([diff(f,'x') diff(f,'y')]);
J = matlabFunction(J);
F = matlabFunction(f);

x = [x0 y0]';

iter = 0;
while 1
    iter = iter +1;
    xp = x;
    
    x = xp - J(xp(1),xp(2))*F(xp(1),xp(2));
    
   
    if norm(x - xp)<tol
        X=x;
        break
    
end



end