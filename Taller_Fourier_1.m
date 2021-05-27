%PUNTO 1

clc
clear all

n=200;

%Creamos un circulo 
Teta =linspace(0,2*pi,n);
X= cos(Teta);
Y= sin(Teta);

Z = complex(X,Y);

Re_Z=real(Z);
Ima_Z=imag(Z);

%Creamos el ruido
R_1= randn(1,n);
R_2=randn(1,n);

max_R_1= maximo(R_1);
max_R_2= maximo(R_2);

R_1= R_1./max_R_1;
R_2= R_2./max_R_2;

%Creamos el circulo con ruido
Re_C_R= Re_Z + R_1;
Ima_C_R= Ima_Z + R_2;

C_R = complex(Re_C_R,Ima_C_R);

%Grafica Circulo con ruido y sin ruido
figure
grid on
plot(Z,'b');
hold on 
plot(C_R,'-.r');
legend('Circulo sin Ruido','Circulo con Ruido')
title('Circulos_1')
%saveas(gcf,'Circulos_1.png')

%Graficas Parte real con ruido y sin ruido
figure
grid on
plot(Re_Z,'b');
hold on 
plot(Re_C_R,'-.r');
legend('Parte Real sin ruido','Parte Real con Ruido')
xlabel('Muestras(n)')
ylabel('Amplitud')
title('Parte Real')
%saveas(gcf,'Real.png')

%Graficas parte imaginaria con ruido y sin ruido 
figure
grid on
plot(Ima_Z,'b');
hold on 
plot(Ima_C_R,'-.r');
legend('Parte Imaginaria sin ruido','Parte Imaginaria con Ruido')
xlabel('Muestras(n)')
ylabel('Amplitud')
title('Parte Imaginaria')
%saveas(gcf,'Imag.png')

%Tranformada de Fourier

f= fft(Z);
f_2 = fft(C_R);

%Graficamos la amplitud con la transformada de Fourier
figure
grid on
plot(abs(f),'b');
hold on 
plot(abs(f_2),'-.r');
legend('Número Complejo sin Ruido','Número Complejo con Ruido')
xlabel('Muestras(n)')
ylabel('Amplitud')
title('Amplitud de los Coeficientes de Fourier')
%saveas(gcf,'amplitudF.png')

%Graficamos el Angulo de la Transformada de Fourier
figure
grid on
plot(angle(f),'b');
hold on 
plot(angle(f_2),'-.r');
legend('Número Complejo sin Ruido','Número Complejo con Ruido')
xlabel('Muestras(n)')
ylabel('Amplitud')
title('Angulo de los Coeficientes de Fourier')
%saveas(gcf,'anguloF.png')

%Circulo con filtro y la inversa de la transformada de fourier
%Filtro (1)
m = 18;

figure
title("Circulos con filtro")
grid on 
plot(Z,'g');
hold on

min = m;
max = n-m;
f_2(min:max) = 0;
W = ifft(f_2);
str = "-."+"r";

plot(real(W),imag(W),str);
hold on 

%Filtro (2)
min = m-5;
max = n-m+5;
f_2(min:max) = 0;
W = ifft(f_2);
str = "-."+"b";

plot(real(W),imag(W),str);
hold on

%Filtro (3)
min = m-10;
max = n-m+10;
f_2(min:max) = 0;
W = ifft(f_2);
str = "-."+"p";

plot(real(W),imag(W),str);
legend('Circulo sin Ruido','Circulo Filtrado','Circulo Filtrado (1)','Circulo Filtrado (2)')
xlabel('Real')
ylabel('Imaginario')

%DESPUES DEL FILTRADO

%Parte Real Despues del Filtrado
figure
grid on
plot(Re_Z,'b');
hold on 
plot(real(W),'-.r');
legend('Número Complejo sin Ruido','Número Complejo con Ruido')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
title('Parte real Filtrado')


%Parte Imaginaria Despues del Filtrado
figure
grid on
plot(Ima_Z,'b');
hold on 
plot(imag(W),'-.r');
legend('Número Complejo sin Ruido','Número Complejo con Ruido')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
title('Parte Imaginaria Filtado')





