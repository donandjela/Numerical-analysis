function R=Hausholder(A)
[m n]=size(A);

for i=1:n-1
    x=A(i+1:end,i);
    sigma=norm(x);
    k=-sigma*sign(x(1));
    e=eye(length(x),1);
    u=x-k*e;
    beta=inv(sigma*(sigma+abs(x(1))));
    H=eye(length(x))-beta*u*u';
    
    T=[eye(i,n);zeros(n-i,i) H];
    
    A=T*A*T;
end
R=A;



end