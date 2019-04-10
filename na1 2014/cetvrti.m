function p=cetvrti(A)

[m n]=size(A);

for i=1:n
    S(i)=trace(A^i);
end
sum=0;
p(1)=-S(1)
for k=2:n
   
    for i=1:k-1
      sum=sum+S(i)*p(k-i);
    end
    
    p(k)=-1/k*(S(k)+sum);
    sum=0;
end;

p=(-1)^n*[1 p];
    
    
end
    




