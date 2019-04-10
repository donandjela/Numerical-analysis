function [X k]=relaksaciona(A,b,w,tol)

[m n]=size(A);
p=zeros(n,1);
p(1)=1;


L=tril(A,-1);
D=diag(diag(A));
U=triu(A,1);

B=-inv(w*L+D)*(w*U+(w-1)*D);
C=w*inv(w*L+D)*b;


k=0;

while 1
    k=k+1;
    X=B*p+C;
   if norm(X-p,inf)<tol 
    return;
   end
   p=X;
end 


end

