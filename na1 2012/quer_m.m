function [v, briter] = quer_m(A, tol)

v = diag(A);
briter = 0;
[m, n] = size(A);

while 1
    p = A(n,n);
    [Q, R] = GivensQR(A-p*eye(size(A)));
    A = R*Q + p*eye(n);
    M = max(abs(v-diag(A)));
    v = diag(A);
    briter = briter + 1;
    
    if M<tol
        break;
    end
end
end