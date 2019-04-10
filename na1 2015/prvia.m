function [X, k] = prvia(gama, tol, x0)

% najstrmiji spust

A=[2 0 2;0 gama 1; 2 1 gama^2];
b=[-1 -1 -1]';

iter=0;

while 1
iter=iter+1;

r=A*x0-b;
d=-r;

if norm(r)<tol
    X=x0;
    k=iter;
    return;
end

lambda= r'*r/(r'*A*r);
x=x0+lambda*d;

x0=x;



end

end