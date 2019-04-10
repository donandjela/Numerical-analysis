function x=gausseidel(tol)
matrica;

B=-inv(L+D)*U;
C=inv(L+D)*b;


while 1
    
    x=B*p+C;
    if norm(x-p)<tol
        return;
    end
    p=x;
end


end