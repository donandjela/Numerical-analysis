
t=0.5;
A=[1 t t^2 0 0; t 1 t t^2 0; t^2 t 1 t t^2;0 t^2 t 1 t;0 0 t^2 t 1];
b=[1 1 1 1 1]';

[m n]=size(A);
L=tril(A,-1);
D=diag(diag(A));
U=triu(A,1);
p=rand(n,1);