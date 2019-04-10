function [c1 c2 c3 c4] = drugi(x,y)

% [c1 0 c2 0 c3 c4] ovakav polinom
x=x';
y=y';
n = length(x);
A = [x.^5 x.^3 x ones(n,1) ];
A
% sistem A*c = y
% A'*A*c = A'y

C = (A'*A)\(A'*y);
C

c1 = C(1);
c2 = C(2);
c3 = C(3);
c4 = C(end);




end