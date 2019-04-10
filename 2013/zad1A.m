function zad1()

z=[0.0001 0.0042 -0.2450 -0.0298 -0.0000; 
   -0.0005 0.3265 -5.6803 -0.4405 0.0036; 
   -0.0365 -2.7736 0.9810 3.2695 0.0331; 
   -0.0031 0.4784 7.9966 1.1853 0.0044; 
    0.0000 0.031 0.2999 0.0320 0];

x=linspace(-3,3,5);
y=linspace(-3,3,5);
xrep=repmat(x,5,1)
yrep=repmat(y',1,5)

mesh(xrep,yrep,z);

I=linspace(-3,3,50);
J=linspace(-3,3,50)';
A=zeros(50);
for i=1:length(I)
    for j=1:length(I)
        A(i,j)=interp2(xrep,yrep,z,I(i),J(i));
    end
end
[I J] = meshgrid(I,I);
mesh(I,J,A);

