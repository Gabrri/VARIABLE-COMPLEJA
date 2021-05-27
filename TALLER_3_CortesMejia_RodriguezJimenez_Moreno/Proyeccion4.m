%PUNTO 2 PROYECCION ESTEREOGRAFICA
%JUAN CAMILO RODRIGUEZ, DAVID MORENO, GABRIELA CORTES

%Radio Circulo Grande
rad= 0.4;
%Radio Circulos Pequeños
rad_2 = 0.2;
%Vector con 9000 puntos de -9 a 9
Teta = linspace(-9,9,9000);
X = [];
Y = [];

x = 8.*sin(6.*Teta).*sin(sin(7.*Teta));
y = 8.*cos(6.*Teta).*sin(sin(7.*Teta));

X = horzcat(X, x);
Y = horzcat(Y, y);

X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;

X = horzcat(X, -7.*y+150);
Y = horzcat(Y, x);

X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;

X = horzcat(X, -7.*y+150);
Y = horzcat(Y, x);

%Creacion de los puntos complejos
Z = complex(X, Y);

%Ecuaciones del plano complejo a la esfera de Riemann
    norm = sqrt((real(Z)).^2+(imag(Z)).^2);
    norm_2 = norm.^2;
    X1 = 2.*real(Z)./((norm_2)+1);
    X2 = 2.*imag(Z)./((norm_2)+1);
    X3 = ((norm_2)-1)./((norm_2)+1);


%Generacion de la figura en el plano complejo
figure
plot(X, Y, 'b')
grid on
xlim([-10 10])
ylim([-10 10])
xlabel('Eje Real')
ylabel('Eje Imaginario')
title('Plano Complejo')


%Generacion de la figura en la esfera de Riemann
figure
[a,b,c] = sphere(30);
plot3(a, b, c,'LineStyle','--','color',[0.3,0.3,0.3]);
hold on
grid on
plot3(X1, X2, X3, 'b')
xlim([-2 2])
ylim([-2 2])
zlim([-2 2])
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')
title('Proyección Estereográfica')
axis equal