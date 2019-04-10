function cevi(x,y)

%x=[1.595 0.462 -0.811 -0.458 0.827 2.662];
%y=[1.004 0.760 -0.017 -2.419 -2.751 -1.981];


% [x1 ... x6] [y1 .. y6]
n=length(x)
%[c1 c2 c3]
B = x.^2 + y.^2;
A = [2*x 2*y ones(n,1)];

C = (A'*A)\(A'*B)
r = sqrt(C(1)^2+C(2)^2+C(3))

f = @(x,y,c1,c2,r2) (x-c1).^2+(y-c2).^2-r2;

G = f(x,y,C(1),C(2),C(3))

if any(abs(G)>0.1)
    disp('Proizvod ne zadovoljava uslove');
else
    disp('Proizvod zadovoljava uslove');
end




end