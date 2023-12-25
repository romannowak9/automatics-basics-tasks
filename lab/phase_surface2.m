%Skrypt podobny do skryptu z cwiczenia dot układów liniowych, ale adaptowany do analizy stabilności
%z wykorzystaniem 1 metody Lapunova:
%Poniżej wpsiujemy parametry:
%parametry b,c>0:
%parametr d<0,
% |c|<|d|
%
T=10; %końcowy czas symulacji
P=20; %ilość warunków początkowych do testu. Mniejsza ilość daje lepszą czytelność, ale większa ilość
% pozwala dokładniej oszacować obszar przyciągania asymptotycznego.
%pusty wykres:
figure;hold on; grid on;
%wrysowanie punktow równowagi na wykresie:
if d<0
 %punkty niestabilne:
 plot(sqrt(-c/d),0,'+','linewidth',3,'color',[.5 0 0]);
 plot(-sqrt(-c/d),0,'+','linewidth',3,'color',[.5 0 0]);
 %punkt stabilny:
 plot(0,0,'*','linewidth',3,'color',[0 .5 0]);
end
%Wyznaczanie zbioru warunków poczatkowych obejmujących całą pł. fazową:
a=0:(pi/P):(2*pi);
X1=[cos(a);sin(a)];
X2=X1./[max(abs(X1));max(abs(X1))];
%
M=size(X2,2);
for m=1:M
 x0=X2(:,m);
 %tu wpisujemy nazwę funkcji z modelem układu n-l:
 out = sim('lab11.slx', T);
 %plot(out.x1(:,1),out.x2(:,2),'k-');
 plot(out.x1,out.x2,'k-');
 %tu dodać resztę

 % opis wykresu
 % title('a='num2str(a),'b='num2str(b),'c=',num2str(c));
 xlabel('x_1');ylabel('x_2'); 
end