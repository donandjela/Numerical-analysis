function Y=interp1Hermite(varargin)

% INTERP1HERMITE    interpolacija Hermitovim interpolacionim polinomima
% Tablica interpolacije mora da sadrzi bar jedan cvor, svi cvorovi moraju biti razliciti i 
% za svaki cvor mora biti navedena bar vrednost same funkcije
%
% Funkcija uzima promenjivi broj argumenata
% Argumenti funkcije su :
%   x1,x2,...,xn - vektori vrste koji odgovaraju cvorovima interpolacije. 
%       Svaki vektor sadrzi vrednost cvora, zatim vrednost funkcije u cvoru za kojim mogu da 
%       slede vrednosti visih izvoda i to redom prvog, drugog itd. 
%           Znaci : x1 = [x1 f(x1) f'(x1) f''(x1) ... f'n1'(x1)]
%
% Funkcija vraca:
%   vektor koeficijenata interpolacionog polinoma u standardnom MATLAB-ovom zapisu 



%Provera uslova zadatka VARARGIN-promenljiv broj ul. argumenata
if length(varargin)<1
    error('Potrebno je da postoji bar jedan cvor interpolacije')
end

% proveravamo razlicitost svih cvorova interpolacije
% prilikom izgradnje vektora x, petlja ide unazad da se ne bi u svakom koraku 
% vrsila realokacija vektora x
for i=length(varargin):-1:1
    x(i)=varargin{i}(1);
end
if (~isequal(x,unique(x)))
    error('Svi cvorovi interpolacije bi trebalo da budu razliciti')
end

% vektor indeksa cvorova koji odgovaraju pojedinim redovima tabele podeljenih razlika
index=[];       
% xrep sadrzi vrednosti cvorova interpolacije i to ponovljene odgovarajuci broj puta
xrep=[];    
% yrep sadrzi vrednosti funkcije u cvorovima (takodje ponovljene)
yrep=[];    
                

%Stepen interpolacionog polinoma
N=0;    

%Za svaki navedeni argumenat proveravamo ispravnost i ujedno gradimo vektore index, xrep i yrep
for i=1:length(varargin)
    [m,n]=size(varargin{i}); % duzina i-tog navedenog vektora

    %Provera valjanosti
    if (m~=1)
        error('Argumenti bi trebalo da su vektori vrste!')
    end
    if (n<2)
        error('Potrebno je da svaki vektor sadrzi bar cvor interpolacije i vrednost same fje u cvoru')
    end

    % red najveceg izvoda u tekucem cvoru
    ni=n-1;
    
    % gradimo vektor indeks tako sto mu broj i DOPISEMO ni puta
    index=[ index repmat(i,1,ni) ];
    % gradimo vektore xrep i y rep tako sto odgovarajuci broj puta ponovimo vrednost cvora 
    % i vrednost funkcije u cvoru
    xrep=[ xrep repmat(varargin{i}(1),1,ni) ];
    yrep=[ yrep repmat(varargin{i}(2),1,ni) ];
    
    %stepen polinoma se uvecava za ni
    N=N+ni;
end
index
xrep
yrep

%Stepen polinoma je n1+n2+..+nm-1
N=N-1;

%pomocni vektor diffs sadrzi kolonu po kolonu tabele podeljenih razlika
diffs=yrep;  %inicijalizuje se na vektor ponovljenih vrednosti funkcije u cvorovima

%vektor diffs_1 sadrzi vrednosti prvih elemenata kolona podeljenih razlika
diffs_1=zeros(1,N+1);  %prealokacija
diffs_1(1)=diffs(1); % sada 5

for j=1:N
    %izracunavamo elemenat po elemenat j-te kolone
    for i=1:N-j+1 % u j-toj koloni tabele podeljenih razlika imamo N-j+1 elemenata (tj. u prvoj 7, u drugoj 6 ...)
        if index(i)==index(i+j)
            % radi se znaci o razlici oblika [xi,xi,..,xi], a nju izracunavamo
            % preko date vrednosti izvoda
            % prod(v) je proizvod elemenata vektora v (prod(1:j) je j!)
            diffs(i)=varargin{index(i)}(j+2)/prod(1:j);
        else
            % inace podeljenu razliku racunamo preko rekurentne formumle
            diffs(i)=(diffs(i+1)-diffs(i))/(xrep(i+j)-xrep(i));
        end
    end
    diffs_1(j+1)=diffs(1); %diffs_1 sadrzi vrednosti prvih elemenata kolona podeljenih razlika
end
diffs_1;

% Vektor P ce da sadrzi koeficijente interpolacionog polinoma, posto je stepen N, vektor je sirine N+1
% Prilikom racunanja koeficijenata ovog vektora posluzicemo se sledecim "trikom"
%   P=diffs_1(1)+diffs_1(2)(x-x0)+...+diffs_1{N+1}(x-xo)^(n0)(x-x1)^(n1)..(x-xm)^(nm-1)
% predstavimo taj polinom u obliku :
%   P =diffs_1(1) + (x-x0)*P1
%   P1=diffs_1(2) + (x-x0)*P2
%   ....
%   PN=diffs_1(N+1)
%
% Postupak je sada sledeci : postavimo sada P na vrednost polinoma PN i mnozeci ga odgovarajucim
% faktorima i dodajuci podeljene razlike, iterativno dodjimo do njegove prave vrednosti
% Postupak je donekle slican Hornerovoj semi


P = diffs_1(N+1) %inicijalizujemo vrednost polinoma na f[x0,..,x0,xm,...,xm]
for j=N:-1:1
    P=conv(P,[1 -xrep(j)]);  %mnozimo ga sa (x-xj)
    P(end)=P(end)+diffs_1(j); %dodajemo mu odgovarajucu podeljenu razliku
end

Y=P;
