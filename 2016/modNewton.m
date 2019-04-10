function brIter = modNewton(f,x0,tol)

    brIter = 0;
    
    J = inv([diff(f,'x'), diff(f,'y')]);
   
    J = matlabFunction(J);
    F = matlabFunction(f);
    
    x=x0;
    
    while 1
        brIter = brIter + 1;
        xp = x;
      
       
      x = xp - J(x0(1),x0(2))*F(xp(1),xp(2));


if norm(x-xp)<tol
    disp(['Broj potrebnih iteracija za dostizanje ovog resenja moldifikovanom Njutnovom metodom je ' num2str(brIter)]);     
        break;   
end
    end


end