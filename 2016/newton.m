function brIter = newton(f,x0,tol)

J = inv([diff(f,'x') diff(f,'y')]);

J = matlabFunction(J);
F = matlabFunction(f);

x = x0;
brIter = 0;

while 1
    brIter = brIter + 1;
    xp = x;
    
    
    x = xp -J(xp(1),xp(2))*F(xp(1),xp(2));
    
    if norm(x-xp)<tol
        disp(x(1))
        disp(x(2))
        disp(['Broj potrebnih iteracija za dostizanje ovog resenja Njutnovom metodom je ' num2str(brIter)]);
        break;   
end


end