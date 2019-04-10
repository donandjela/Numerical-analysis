function G = gegenbauer(n,a)
% vraca gegenbauerov n-tog stepena
% a je alpha


G{1} = [1];
G{2} = [2*a 0];

for k = 2: n
    
    P = conv([2*(k+a-1) 0],G{k});
    W = (k +2*a-2)*G{k-1};
    G{k+1}=1/k*(P - [0 0 W]);
end

G=G{n+1};



end