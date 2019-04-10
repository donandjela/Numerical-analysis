function [X W]= relax(A,b,tol)

w=0.1:0.1:1.9;
x=[];
for i=1: length(w)
    [x1 br]=relaksaciona(A,b,w(i),tol);
    brzina(i)=br;
    x=[x x1];
end

plot(w,brzina);

[i]=find(brzina==min(brzina));
W=w(i);
X=x(i)


end