

 function Mandelbrot()
    n=5000;%numero de puntos
    iteraciones = 50;%Cantidad de iteraciones

   %ejes parte real y parte imaginaria
   x_min = -2;   
   x_max = 2;
   y_min = -2;     
   y_max = 2;
   
 
  %creamos n puntos en el intervalo de x_min a x_max y lo mismo para y
   x=linspace(x_min, x_max, n);
   y=linspace(y_min, y_max, n);
   
   %contendra los puntos c 
   [X Y] = meshgrid(x, y);
   
   %numero complejo c
   c = X + 1i * Y;
   
   %Definimos la matriz de ceros que va a contener los terminos de z_n en
   %cada iteracion
   Z = zeros(size(c));
   
   %contiene el numero de iteraciones necesarias para que el modulo de cada
   %elemento de Z sea > 2
   m=Z;
   
   for p = 1:iteraciones
       Z = Z.^2 + c;
       m = m + (abs(Z)>2); %llenamos la matriz vacia m
   end
   
   figure
   imagesc(m)
end

  