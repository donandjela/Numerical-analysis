function N = zad2b(a,b,x,tol)

H = zad2(a,b,1);
N = 1;
f = sym('3*x*sqrt(x-1)');
f = matlabFunction(f);

while abs(f(x)-polyval(H,x))>tol
    N = N+1;
    H = zad2(a,b,N);

end

end