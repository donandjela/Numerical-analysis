function X=gaus(tol)

matrica;

B=-inv(D+L)*U;
C=inv(D+L)*b;



while 1
    X=B*p+C;
    
    if norm(X-p)<tol
        return;
    end
    p=X;
end
    

end