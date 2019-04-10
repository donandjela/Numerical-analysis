function crtaj(f)
a=1:10;

G = @(p) sqrt(integral(@(x)pom(x,f,p),-1,1));

for k= 1:10
 P{k} = zad3(f,k);
 g(k) = G(P{k});
end
disp('g')
g
plot(a,g,'r');

function y = pom(x,f,p)
y = (f(x)-polyval(p,x)).^2;