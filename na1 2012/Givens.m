function R=Givens(A)

[m n]=size(A);

for k=2:n-1
    for l=k+1:n
        
        if A(l,k-1)==0
            alfa=0;
            beta=1;
        
        end
        alfa= abs(A(k,k-1))/sqrt(A(k,k-1)^2+A(l,k-1)^2);
        beta=alfa*A(l,k-1)/A(k,k-1);
        
        U=eye(n);
        U(k,k)=alfa;
        U(k,l)=-beta;
        U(l,k)=beta;
        U(l,l)=alfa;
        
        A=U'*A*U;
    end
   
end
 R=A;
end