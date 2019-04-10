function [P H]=hholder(T)


%||rt||=sqrt()
n=length(T);
normRT=sqrt(sum(T.^2));
P=zeros(n,1);

P(1)=abs(normRT);

sigma=norm(T,2);
k=-sigma*sign(T(1));
e1=eye(n,1);
u=T'-k*e1;
%RAZJASNI!!!
beta=inv(sigma*(sigma+abs(T(1))));
H=eye(n)-beta*u*u';
H=-H;

end