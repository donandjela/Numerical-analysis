function P=cetvrti(A)

[m n]=size(A);
b=zeros(m,1);
b(1)=1;
b
B=[b];
for i=1:n-1
    b=A*b;
    B=[B b];
end
P= (-1)^n*[1 flip(linsolve(B,-A*b)')];



end