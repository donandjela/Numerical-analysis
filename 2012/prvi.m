function [Q] = prvi(f,alter,a,b)

n = length(alter);
A = ones(n);
if n>2
    A(:,n-1) = alter';
    
    for i = n-2:-1:2
        A(:,i) = alter'.*A(:,i+1);
    end
end

A(1:2:n,1) = -1;
B = f(alter');
Q = A\B;

L = abs(Q(1));

if Q(1)>=0
    alfa = 1;
else
    alfa = -1;
end

Q = Q(2:end)';

xx = linspace(a,b,1000);
plot(xx,f(xx),xx,polyval(Q,xx));

disp('greska je')
disp(L)


end