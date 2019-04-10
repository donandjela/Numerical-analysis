function A1=hesenberg(A)

[m n]=size(A);

for k=2:n-1
    for l=k+1:n
        A=treci(A,l,k-1);
    end
end
A1=A;

end