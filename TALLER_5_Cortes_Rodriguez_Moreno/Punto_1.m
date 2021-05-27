% Matriz de Colores 0-255
Col = linspace(0, 255, 256);
I = ones(length(Col), 1) * Col;

%Mostramos la imagen original antes de aplicar la transformada
figure 
imagesc(I)
title("Imagen Original")
axis off
colormap gray

% Creamos el plano complejo asociado a la imagen C
Pc = Plano_Complejo(I); 

% Definimos nuestra transformacion Z_T= exp(Z)
Z_T = @(Z) exp(Z); 

% Aplicamos la Transformacion de Coordenadas
Pc_exp = Z_T(Pc);

% Graficamos la Imagen Transformada
Func_Graficar(I, Pc_exp, "ImagenTransformada.png");
