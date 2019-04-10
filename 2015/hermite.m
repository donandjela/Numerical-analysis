function P = hermite(T)


[m n]= size(T);
T1=T(:,1:end-1)
Tab = [];
for i=1:m
    Tab = [Tab; repmat(T1(i,1:2),2,1)];
end

index = 1:m;
index = sort([index index])';

diffs = Tab(:,2);
N = 2*m-1;
diffs_1=zeros(1,N+1);  %prealokacija
diffs_1(1)=diffs(1); 

for j= 1:N
    for i=1:N-j+1
        if index(i)==index(i+j)
            diffs(i) = T(i,j+2)/prod(1:j);
        else
            diffs(i) = (diffs(i+1)-diffs(i))/(T(i+j,1)-T(i,1));
        end
    end
    diffs_1(j+1) = diffs(1);
end

    
 P = diffs_1(N+1) %inicijalizujemo vrednost polinoma na f[x0,..,x0,xm,...,xm]
for j=N:-1:1
    P=conv(P,[1 -xrep(j)]);  %mnozimo ga sa (x-xj)
    P(end)=P(end)+diffs_1(j); %dodajemo mu odgovarajucu podeljenu razliku
end
           








end