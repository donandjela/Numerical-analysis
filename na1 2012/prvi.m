function prvi(tol,k)

dim=2:k;

for i=1:length(dim)
    A=wilkinson(dim(i));
    [o v(i)]=kuer_o(A,tol);
   
    [M w(i)]=kuer_m(A,tol);
    
end

hold on
plot(dim,v,'b');
plot(dim,w,'r');
hold off



end