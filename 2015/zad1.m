function P = zad1(f,alfa,n)

p = @(x) (1-x.^2).^(alfa-0.5);

%G = gegenbauer(n,alfa);
P = zeros(1,n+1);

for k = 1: n+1
    G=gegenbauer(k-1,alfa);
    W =  integral(@(x)pom1(x,p,f,G),-1,1)/integral(@(x)pom2(x,p,G,G),-1,1);

    P = P + [zeros(1,n-k+1) W*G];
end


function y = pom1(x,p,f,Pn)
    y = p(x).*f(x).*polyval(Pn,x);
    
function y = pom2(x,p,f,Pn)
    y = p(x).*polyval(f,x).*polyval(Pn,x);