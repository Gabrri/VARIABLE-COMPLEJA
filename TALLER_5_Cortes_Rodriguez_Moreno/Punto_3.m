% Matriz de Colores de pixeles de la imagen creaci�n
imdata = imread('creacion.png');

%Mostramos la imagen original antes de aplicar la transformada
figure 
imagesc(imdata)
title("Imagen Original(Creaci�n)")
axis off
colormap gray

% Creamos el plano complejo asociado a la imagen Creaci�n
Pc = Plano_Complejo(imdata); 

% Definimos nuestra transformacion Z_T=e^z
Z_T = @(Z) exp(Z); 

% Definimos nuestra transformacion Z_T= Z^2+1 
Z_T1=@(Z) Z.^2+1;

% Aplicamos la Transformacion de Coordenadas
Pc_exp = Z_T(Pc);
Pc_Z=Z_T1(Pc);

% Graficamos las Imagenes Transformadas
Func_Graficar(imdata, Pc_exp, "Transformaci�n  Z_T=e^z");
Func_Graficar(imdata, Pc_Z, " transformacion Z_T= Z^2+1");


