function trecic(x0,y0,k)

s = 1:k;
X = 10.^(-s);

n = length(s);

for i=1:n
   [x p] = trecia(10.^-s(i),x0,x0);
   P(i) = p;
   [x q] = trecib(10.^-s(i),x0,x0);
   Q(i) = q;
   
    
    
end

plot(X,P,X,Q);


end