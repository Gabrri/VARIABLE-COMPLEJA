%PUNTO 2 PROYECCION ESTEREOGRAFICA
%JUAN CAMILO RODRIGUEZ, DAVID MORENO, GABRIELA CORTES

%Radio Circulo Grande
rad= 0.4;
%Radio Circulos Pequeños
rad_2 = 0.2;
%Vector con 600 puntos de 0 a 2pi
Teta = linspace(0,2*pi, 70);
X = [];
Y = [];
for i = 1:7
    % Generacion del Circulo
    x = rad*cos(Teta);
    y = rad*sin(Teta);
    %Creamos un pologono regular de n lados
    n = 2; %En este caso se van a dibujar pentagonos
    r = 0.5;
    Thet = (0:2*pi/n:2*pi) ;
    for i = 1:5:length(x)
        x1 = r.*cos(Thet) + x(i);
        y1 = r.*sin(Thet) + y(i);
        %Elimina el cambio de posicion que hay entre los circulos
        X(length(X)+1) = NaN;
        Y(length(Y)+1) = NaN;
        %Concatenamos las filas de circulos
        X = horzcat(X, x1);
        Y = horzcat(Y, y1);
    end 
    rad = rad + 0.3;
end

%Creacion de los numeros complejos
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
xlim([-2 2])
ylim([-2 2])
xlabel('Eje Real')
ylabel('Eje Imaginario')
title('Plano Complejo Pentagonos')


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
title('Proyección Estereográfica Pentagonos')
axis equal