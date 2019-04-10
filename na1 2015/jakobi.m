function sv=jakobi(A)
[m n]=size(A);

ni=norm(triu(A,1),'fro');
while 1
   [k,l]=find(tril(abs(A),-1)==max(max(tril(abs(A),-1))));
   
   if(length(k)>1 && length(l)>1)
        k=k(1);
        l=l(1);
   end
    
   if abs((A(k,k)-A(l,l))<eps)
       if A(k,l)>0
            cos_fi=sqrt(2)/2;
            sin_fi=sqrt(2)/2;
        else
            cos_fi=-sqrt(2)/2;
            sin_fi=sqrt(2)/2;
        end
   else
        %stabilan algoritam
        
        lambda=-A(k,l);
        mi=(A(l,l)-A(k,k))*0.5;
        omega=sign(mi)*lambda/sqrt(lambda^2+mi^2);
        sin_fi=omega/sqrt(2*(1+sqrt(1-omega^2)));
        cos_fi=sqrt(1-sin_fi^2);
   end
   U=eye(n);
    U(k,k)=cos_fi;
    U(l,l)=cos_fi;
    U(k,l)=-sin_fi;
    U(l,k)=sin_fi;
    
    A=U'*A*U;
   
   if (norm(triu(A,1),'fro')<=eps*ni)
    sv=diag(A);
     return;
    
end





end