function [Lmax Lmin]=drugi(A,tol)

Lmax=proizvVektor(A,tol);
Lmin=1/proizvVektor(inv(A),tol);

end