function zad1(X,f,f1)
%X-podela intervala, f-fja, f1-vr izvoda u krajnjim tackama

xx = linspace(X(1), X(end), 1000);
Y = f(X);
%periodicni
per = csape(X,Y, 'periodic');
greskaP = f(xx)-ppval(per,xx);

%sa zadatim izvodima
izv = spline(X, [f1(1) Y f1(2)]);
greskaI = f(xx)-ppval(izv,xx);

%prirodni
prir = csape(X, Y, 'second');
greskaPR = f(xx)-ppval(prir,xx);

p = norm(greskaP, inf);
i = norm(greskaI, inf);
pr = norm(greskaPR, inf);
Pomoc = [p i pr]

if min(Pomoc) == p
    disp('Funkciju nakbolje aproksimira periodicni splajn');
    disp('Greska je: ');
    disp(p);
else if min(Pomoc)==i
        disp('Funkciju nakbolje aproksimira splajn sa zadatim prvim izvodima');
        disp('Greska je: ');
        disp(i);
    else
        disp('Funkciju nakbolje aproksimira prirodni splajn');
        disp('Greska je: ');
        disp(pr);
    end
end
    
plot(xx, greskaP, xx, greskaI, xx, greskaPR);
legend('periodicni', 'sa zadatim prvim izvodima', 'prirodni');