function [Lj,Lgz] = drugi(t)

matrica; 

Bj=-inv(D)*(L+U);
Bgz=-inv(D+L)*U;

Lj=max(abs(eig(Bj)));
Lgz=max(abs(eig(Bgz)));


end