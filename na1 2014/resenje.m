function x=resenje(tol)

 [Lj,Lgz] = drugi(0.5);

 if(Lj<1)
     x=jakobi(tol);
 else
     x=gaus(tol);
 
end

