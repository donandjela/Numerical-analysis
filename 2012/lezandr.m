function L = lezandr(n)

L{1}=[1];
L{2}=[1 0];

for i = 2:n
   L{i+1} = ((2*i-1)/i)*[L{i} 0] - [ 0 0 (i-1)/i*L{i-1}]; 
end

L = L{n+1};





end