function H = zad2(a,b,n)

f = sym('3*x*sqrt(x-1)');
f1 = diff(f);

f = matlabFunction(f);
f1 = matlabFunction(f1);

X = linspace(a,b,n);
Y = f(X);

xrep = [];
yrep = [];
for i = 1:n
    xrep = [xrep repmat(X(i),1,2)];
    yrep = [yrep repmat(Y(i),1,2)];
end
    
    
N=2*n-1;
    
diffs = yrep;
diffs_1= zeros(1,N+1);
diffs_1(1) = diffs(1);

for j=1: N
    for i= 1: N-j+1
        if xrep(i)==xrep(i+j)
            diffs(i) = f1(xrep(i))/factorial(j);
        else
    diffs(i) = (diffs(i+1)-diffs(i))/(xrep(i+j)-xrep(i));
        end
    end
    diffs_1(j+1)=diffs(1);
end

P = diffs_1(N+1);

for j=N:-1:1
    P = conv(P,[1 -xrep(j)]);
    P(end) = P(end) +diffs_1(j);
end

H=P;

    
    
    
    




    
    
    
end