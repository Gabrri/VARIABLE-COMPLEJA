%PUNTO 1 PROYECCION ESTEREOGRAFICA DE UN PUNTO
%JUAN CAMILO RODRIGUEZ, DAVID MORENO, GABRIELA CORTES

%Punto en el plano complejo
Z = 2+2i;

%Ecuaciones del plano complejo a la esfera de Riemann
    norm = sqrt((real(Z)).^2+(imag(Z)).^2);
    norm_2 = norm.^2;
    X1 = 2.*real(Z)./((norm_2)+1);
    X2 = 2.*imag(Z)./((norm_2)+1);
    X3 = ((norm_2)-1)./((norm_2)+1);


%Generacion del punto en el plano complejo
figure
plot(real(Z),imag(Z), '*')
grid on
xlim([-real(Z)-3 real(Z)+3])
ylim([-real(Z)-3 real(Z)+3])
xlabel('Eje Real')
ylabel('Eje Imaginario')
title('Plano Complejo Punto')


%Generacion de la figura en la esfera de Riemann
figure
%Generamos la esfera
[a,b,c] = sphere(30);
plot3(a, b, c,'LineStyle','--','color',[0.4,0.4,0.4]);
hold on
grid on
%Ploteamos el punto en la esfera de Riemann
plot3(X1, X2, X3, '*')
xlim([-real(Z)-2 real(Z)+2])
ylim([-real(Z)-2 real(Z)+2])
zlim([-real(Z)-2 real(Z)+2])
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')
title('Proyección Estereográfica de Un Punto')
axis equal