function [sopVred sopVek]=tragovi(A,tol)

[m n]=size(A);

k=0;
trA0=trace(A);
while 1
    k=k+1;
    B=A^(2*k);
   trA=trace(B)^(1/(2*k)); 
   if abs(trA-trA0)<tol
       sopVred=trA;
       sopVek=B*rand(n,1);
       sopVek=sopVek/norm(sopVek);
       
       if ( norm(A*sopVek-sopVek*sopVred))>tol
           sopVred=-sopVred;
       end
       
       
       
       return;
   end
   
   trA0=trA;
    
end



end