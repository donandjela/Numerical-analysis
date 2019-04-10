function gama=drugia()


b=[-1 -1 -1]';

gama=1;

provera=0;

while(1)
    A=[2 0 2;0 gama 1; 2 1 gama^2];
    L=tril(A,-1);
    D=diag(diag(A));
    U=triu(A,1);
    
    Bj=-inv(D)*(L+U);
    %Cj=inv(D)*b;
    
    Bg=-inv(L+D)*U;
    %Cg=inv(L+D)*b;
   
    
    Sj=eig(Bj)
    Sg=eig(Bg)
    
    if max(abs(Sj))<1 && max(abs(Sg))<1
        disp('Obe metode konvergiraju za gama=')
        gama
        
        
        %dijagonalna dominantnost
        if diagDom(A)==1
            disp('Brze konvergia Gaus Zajdel');
        else
            if (max(abs(Sg))<max(abs(Sj)))
                disp('Brze konvergia Gaus Zajdel');
            else
                (max(abs(Sj))<max(abs(Sg)))
                 disp('Brze konvergia Jakobi');
            end
        end
      
        return;
    end
        
    gama=gama+1;
    
end

end