function x=treci(A,b,tol)




[p q]=chol(A);

if q~=0
    error('Metoda se ne moze primeniti,matrica nije pozitivno definitna');
end
[m n]=size(A);
if m~=n
    B=A'*A;
    c=A'*b;
else
    B=A;
    c=b;
end

x=pokoorSpust(B,c,tol);

end