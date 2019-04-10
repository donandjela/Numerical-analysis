function p = zad2(X,Y,n)

% [c1 c2 ... cn, cn+1]
%polinom c1 *x^n + c2*x^(n-1) +...+ cn+1
m = length(X)
A = ones(m,1)

for i=1 :n
   A=[(X.^i)' A];
    
end

 p = ((A'*A)\(A'*Y'))';

end