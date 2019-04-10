function X=pokoorSpust(A,b,tol)

[m n]=size(A);

p=rand(n,1);
k=0;
while 1
    k=k+1;
    d=zeros(n,1);
    d(mod(k-1,n)+1)=1;
    
    r=A*p-b;
    lambda= -r'*d/(d'*A*d);
    X=p+lambda*d;
    
    if(norm(r,inf)<tol)
        return;
    end
    p=X;
        
    
    

end