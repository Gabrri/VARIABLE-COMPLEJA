%PUNTO 2 PROYECCION ESTEREOGRAFICA
%JUAN CAMILO RODRIGUEZ, DAVID MORENO, GABRIELA CORTES

%Radio Circulo Grande
rad= 0.4;
%Radio Circulos Pequeños
rad_2 = 0.2;
%Vector con 600 puntos de 0 a 2pi
Teta = linspace(0,2*pi, 400);
X = [];
Y = [];
for i = 1:9
    % Generacion del Circulo Grande
    x = rad*cos(Teta);
    y = rad*sin(Teta);
    
    % sobre el anterior circulo se hacen hipocicloides
    for j = 1:20:length(x)
        x1 = rad_2*cos(Teta).^3 + x(j);
        y1 = rad_2*sin(Teta).^3 + y(j);
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
title('Plano Complejo Hipocicloide')


%Generacion de la figura en la esfera de Riemann
figure
%Generacion de la esfera
[a,b,c] = sphere(30);
plot3(a, b, c,'LineStyle','--','color',[0.5,0.3,0.3]);
hold on
grid on
plot3(X1, X2, X3, 'b')
xlim([-2 2])
ylim([-2 2])
zlim([-2 2])
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')
title('Proyección Estereográfica Hipocicloides')
axis equal