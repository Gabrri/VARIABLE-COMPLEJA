%Creamos la funcion para graficar la imagen transformada
function Func_Graficar(Imagen, Pc_Transf, Title)
    % Img es la Matriz de la Imagen
    % Pc_Trans es la Matriz de Coordenadas Transformadas

    % Coordenadas complejas para graficar
    Re = real(Pc_Transf);
    Im = imag(Pc_Transf);

    % Transformamos las matrices de coordenadas y de los vectores 
    X = reshape(Re, 1, []); 
    Y = reshape(Im, 1, []);
    I = reshape(Imagen, 1, []);

    % Graficamos las Coordenadas Transformadas en el color gris
    figure
    scatter(X, Y, 100, I ,'filled')
    set(gca, 'Color', 'g')
    title(Title)
    axis off
    colormap gray

end