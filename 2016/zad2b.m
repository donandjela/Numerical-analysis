function P = zad2b(f,p,n)

P= zeros(1,n+1);


for k = 1:n+1
   
    Q = zad2a(p,k-1);
    W = integral(@(x) pom1(x,f,Q,p),-1,1)/integral(@(x)pom2(x,Q,Q,p),-1,1);
    
    P = P + [zeros(1,n-k+1) W*Q];
     
end

function y = pom1(x,f,q,p)
y = f(x).*polyval(q,x).*p(x);

function y = pom2(x,s,q,p)
y = polyval(s,x).*polyval(q,x).*p(x);