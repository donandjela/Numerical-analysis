function sop=proizvVektor(A,tol)

[m n]=size(A);

v=eye(n,1);

while 1
    V=A*v;
    
    vred=V./v;
    
    if(abs(max(vred)-min(vred))<tol)
       sop=max(vred);
       return;
    end
    v=V;
    
    


end