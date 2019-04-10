function Q = zad2a(p,k)

Q{1} = [1];
Q{2} = [1 0];

for i = 2: k+1
   
    P = skal([Q{i} 0],Q{i},p)/skal(Q{i},Q{i},p);
    W = skal(Q{i},Q{i},p)/skal(Q{i-1},Q{i-1},p);
    Q{i+1} = conv([1 0]-[0 P],Q{i}) - [0 0 W*Q{i-1}];
    
end

Q=Q{k+1};

function S = skal(P,Q,p)
S = integral(@(x)pom(x,P,Q,p),-1,1);


function y = pom(x,P,Q,p)
y = p(x).*polyval(P,x).*polyval(Q,x); 