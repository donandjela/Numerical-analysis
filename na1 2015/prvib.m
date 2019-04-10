function prvib(tol,x0)

gama=[2 5 15 10 20 30 40 50];

%Y=zeros(1,length(gama));

for i=1:length(gama)
    [Y,k]=prvia(gama(i),tol,x0);
    y(i)=k;
end

plot(gama,y);



end