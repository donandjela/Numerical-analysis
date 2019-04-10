function lambda=proizvoljniVektor(A,tol)

[m n]=size(A);
v=eye(n,1);
while 1
    
    V=A*v;
    
    P=V./v;
    if(max(abs(P))-min(abs(P))<tol)
        lambda=P(1);
        return;
    end
    v=V;



end