function zad3()

tol = 1e-4;
F = [sym('x*exp(x)-y-2');sym('y^2-x^2-0.5')];

%pocetni
x = 2;
y = 3;
Res = [x y]';
Res1 = [x y]';

Js = [diff(F,'x'), diff(F,'y')];
J = matlabFunction(Js);
F = matlabFunction(F);

W = inv(J(x,y));
ResN = Res - W*F(x,y);
Res1N = Res - W*F(x,y);

iter = 1;
while norm(Res-ResN)>tol
    Res = ResN;
    x = ResN(1);
    y = ResN(2);
    ResN = Res - inv(J(x,y))*F(x,y);
    iter=iter+1;
end
Res = ResN;

iter2 = 1;
while norm(Res1-Res1N)>tol
    Res1 = Res1N;
    Res1N = Res1 - W*F(Res1(1), Res1(2));
    iter2 = iter2 + 1;
end

disp('Resenje je:');
disp('x=');
disp(Res(1));
disp('y=');
disp(Res(2));
disp('Broj potrebnih iteracija za dostizanje ovog resenja Njutnovom metodom je: ');
disp(iter);
disp('Broj potrebnih iteracija za dostizanje ovog resenja modifkovanom Njutnovom metodom je: ');
disp(iter2);

