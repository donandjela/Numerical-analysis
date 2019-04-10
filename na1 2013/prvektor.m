function [Lmax Lmin]= prvektor(A,tol)

Lmin=1/proizvoljniVektor(inv(A),tol);
Lmax=proizvoljniVektor(A,tol);


end