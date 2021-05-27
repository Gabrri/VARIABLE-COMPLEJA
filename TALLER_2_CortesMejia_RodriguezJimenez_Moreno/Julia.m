function Julia(Re,Im,m)
    n=4000;%numero de puntos
    iteraciones = 30;

   %ejes parte real y parte imaginaria
   x_min = -2;   
   x_max = 2;
   y_min = -2;     
   y_max = 2;
   
 
  %creamos n puntos en el intervalo de x_min a x_max y lo mismo para y
   x=linspace(x_min, x_max, n);
   y=linspace(y_min, y_max, n);
   
  %contendra los puntos c 
   [a b] = meshgrid(x, y);
   
   f = a + 1i * b;
   
  %numero complejo c
   c = Re + 1i * Im;
 
  %Definimos la matriz de ceros que va a contener los terminos de z_n en
  %cada iteracion
   Z = zeros(size(f));
   B=Z;
   
   for p = 1:iteraciones
       f = f.^m + c;
       B = B + (abs(f)>2);
   end
   
  figure
  imagesc(B)
end


