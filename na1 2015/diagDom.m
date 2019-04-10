function provera=diagDom(A)

[m n]=size(A);

provera=1;
s=0;
for i=1:n
    for j=1:n
    if(i~=j)
        s=s+A(i,j);
    end
    end
    
    if A(i,i)>s provera=0;
        return;
    end
    s=0;
end

end