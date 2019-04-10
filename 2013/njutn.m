function X = njutn(tol)
syms x;
syms y;
syms z;

f = [x+y+z-1; x^2+y^2+z^2-0.5; z-y^2];
J = inv([diff(f,'x') diff(f,'y') diff(f,'z')]);

J = matlabFunction(J);
F = matlabFunction(f);


x0 = [0, 0.5,0.3]';

x=x0;

while 1
    xp=x;
    x= xp -J(xp(1),xp(2),xp(3))*F(xp(1),xp(2),xp(3));   
    if norm(x-xp)<tol
        X=x;
        break;
    
end




end