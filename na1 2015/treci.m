function treci(A)


provera1=0;

if isequal(A',A) provera1=1;
end

sop=jakobi(A)

if all(sop>0)
    provera2=1;
else provera2=0;
end
    if provera2==1 && provera1==1
        disp('Matrica jeste simetricna i pozitivno definitna');
    else
        disp('Ne zadovoljava trazene uslove');
        
    


end