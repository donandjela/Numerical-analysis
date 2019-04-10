function l=prvi(A,tol)

[m n]=size(A);

[lambda ~]=tragovi(A,tol);

if lambda>0
    l=lambda;
    return;
end



for i=1:n
    [l1 x1]=tragovi(A,tol);
    [L1 y1]=tragovi(A',tol);
    l1
    
    x1=x1/norm(x1);
    y1=y1/norm(y1);
    
    A=A-l1*x1*y1';
    [lambda v]=tragovi(A,tol);
   
    
    if lambda>0
    l=lambda;
    return;
    end

end

disp('Nema pozitivnih sopstvenih vrednosti');
l=0;

end