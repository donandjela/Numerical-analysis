function A1 = treci(A,i,j)

%givens glupi
[m n]=size(A);
if A(i,j)==0 
    alfa=0;
    beta=1;
else
    alfa=abs(A(j+1,j))/sqrt(A(j+1,j)^2+A(i,j)^2);
    beta=A(i,j)/A(j+1,j)*alfa;
    
    U=eye(n);
    U(j+1,j+1)=alfa
    U(j+1,i)=-beta;
    U(i,j+1)=beta;
    U(i,i)=alfa;
    
    A1=U'*A*U;
    



end