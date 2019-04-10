function X=jakobi(tol)
matrica;
Bj=-inv(D)*(L+U);
cj=inv(D)*b;

p=rand(n,1);

while 1
    X=Bj*p+cj;
    
    if(norm(X-p,inf)<tol)
        return;
    end
    p=X;
end
    

end