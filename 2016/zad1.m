function zad1(X,f,f1)
Y=f(X);
s1 = csape(X,Y,'periodic');
s2 = csape(X,Y,'second');
s3 = csape(X, [f1(1) Y f1(2)],'complete');

xx=linspace(X(1),X(end),1000);

y1 = f(xx) - ppval(s1,xx);
y2 = f(xx) - ppval(s2,xx);
y3 = f(xx) - ppval(s3,xx);

plot(xx,y1,xx,y2,xx,y3);
%legend('periodicni','prirodni','sa zadatim izvodima');


g1 = max(abs(y1));
g2 = max(abs(y2));
g3 = max(abs(y3));

Min = min([g1, g2, g3]);

if Min == g1
    disp('Funkciju najbolje aproksimira periodicni splajn');
    disp('Greska je: ');
    g1
end
if Min == g2
    disp('Funkciju najbolje aproksimira prirodni splajn');
    disp('Greska je: ');
    g2
end
if Min == g3
    disp('Funkciju najbolje aproksimira splajn sa prvim izvodima');
    disp('Greska je: ');
    g3
end

