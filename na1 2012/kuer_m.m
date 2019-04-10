function [v, briter]=kuer_m(A,tol)

%A=Hausholder(A);
A=Givens(A);
briter=0;
[m, n]=size(A);
while 1
    briter=briter+1;
    p=A(n,n);
    [Q, R]=GivensQR(A-p*eye(n));
    %[Q R]=qr(A-p*eye(n));
    Ai=A;
    
    A=R*Q+p*eye(n);
    if norm(diag(A)-diag(Ai),inf)<tol)
        v=diag(A);
return
    end
end


end