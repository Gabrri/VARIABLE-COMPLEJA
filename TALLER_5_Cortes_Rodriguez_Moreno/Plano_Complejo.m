%Creamos la funcion para crear las coordenadas del plano complejo asociadas a la matriz
%resultante de la imagen que vamos a usar
function Pc = Plano_Complejo(A)
    [i, j] = size(A);
    a = linspace(-2.*pi, 2.*pi, i);
    b = linspace(-2.*pi, 2.*pi, j);
    b = -1 .* b;
    A = (ones(length(b), 1)) * a;
    B = (b.') * ones(1, length(a));
    Pc = complex(A, B);
end