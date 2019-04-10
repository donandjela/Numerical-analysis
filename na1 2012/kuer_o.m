function [v, briter]=kuer_o(A,tol)

A=Hausholder(A);
A=Givens(A);
briter=0;
[m n]=size(A);
while 1
    briter=briter+1;
    
    [Q R]=GivensQR(A);
    %[Q R]=qr(A-p*eye(n));
    Ai=A;
    
    A=R*Q;
    if( abs(norm(diag(A)-diag(Ai),inf))<tol)
        v=diag(A);
return
    end
end


end