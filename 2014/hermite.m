function P = hermite(X)
% X matrica odg cvorova i izvoda

%{
X [x1 f(x1) ... f'''(x1)]
.
.
X [xn f(xn) ... f'''(xn)]

%}

[m n] = size(X);

index = [];
xrep = [];
yrep = [];

for i = 1:m
   index = [index repmat(i,1,n-1)];
   xrep = [xrep repmat(X(i,1),1,n-1)];
   yrep = [yrep repmat(X(i,2),1,n-1)];
end
[index; xrep; yrep]

N = length(xrep)-1;
diffs = yrep;
diffs_1 = zeros(1,N+1);
diffs_1(1) = yrep(1);


for j=1:N
    for i=1:N-j+1
        if index(i) == index(i+j)
            diffs(i) = X(index(i),j+2)/factorial(j);
        else
            diffs(i) = (diffs(i+1)-diffs(i))/(xrep(i+j)-xrep(i));
        end
    end
    diffs_1(j+1)=diffs(1);
end


P = diffs_1(N+1);
for j= N:-1:1
    P = conv(P, [1 -xrep(j)]);
    P(end) = P(end) + diffs_1(j);
end

            
            
            









        

end