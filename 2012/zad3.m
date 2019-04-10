function P = zad3(f,n)

P = zeros(1,n+1);
for k =1:n+1
    L = lezandr(k-1);
    W = integral(@(x) pom1(x,f,L),-1,1) ...
    ./integral(@(x) pom2(x,L,L),-1,1);
    
    P = P + [zeros(1,n-k+1) W*L]
     
end




function y = pom1(x,f,p)
y = f(x).*polyval(p,x);



function y = pom2(x,f,p)
y = polyval(f,x).*polyval(p,x);
