function H = zad2(a,b,n)

f = sym('3*x*sqrt(x-1)');
f1 = diff(f);

f = matlabFunction(f);
f1 = matlabFunction(f1);

x = linspace(a,b,n);
y = f(x);

xrep = [];
yrep = [];

for i = 1:n
    xrep = [xrep repmat(x(i),1,2)]; %imam 2 podatka za svaki cvor, pravim vrstu
    yrep = [yrep repmat(y(i),1,2)];
end

pr = yrep;
pr1 = yrep(1);


N = 2*n-1; %stepen polinoma

for j = 1:N
    for i = 1:N-j+1
        if xrep(i)==xrep(i+j)
            pr(i) = f1(xrep(i))/factorial(j);
        else
            pr(i) = (pr(i+1) - pr(i))/(xrep(i+j)-xrep(i));
        end
    end
    pr1(j+1) = pr(1);
end

H = pr1(end);
for i = N:-1:1
    H = conv(H, [1 -xrep(i)]); %x-xi
    H(end) = H(end) + pr1(i);
end