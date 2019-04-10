function expA=treci(A)

[m n]=size(A);
P=eye(n);
while 1
   
    [Q R]=qr(A);
    P=P*Q;
    A1=A;
    A=R*Q;
    if(norm(diag(A)-diag(A1))<1e-16);
        D=A;
    break;
    end
    
end


expA=P*diag(exp(diag(D)))*P';
end