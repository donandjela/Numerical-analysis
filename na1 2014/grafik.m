function grafik()
t=0:0.1:1;


for i=1:length(t)
    [Lj(i),Lgz(i)] = drugi(t(i));
end
hold on
plot(t,Lj,'b');
plot(t,Lgz,'g--');
hold off;


end