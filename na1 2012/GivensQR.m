function [Q R]=GivensQR(A)

[m n]=size(A);
Q=eye(n);
for k=1:n-1
    for l=k+1:n
        
       if  A(l,k)~=0 
        alfa= (A(k,k))/sqrt(A(k,k)^2+A(l,k)^2);
        beta=-(A(l,k))/sqrt(A(k,k)^2+A(l,k)^2);
        
        U=eye(n);
        U(k,k)=alfa;
        U(k,l)=-beta;
        U(l,k)=beta;
        U(l,l)=alfa;
        
        A=U*A;
        Q=Q*U';
       end
    end
    R=A;
end