% Tenemos que para el conjunto de julia se obtiene al evaluar f(z)=g(z)+c
% Vamos a definir la variable c Como un vector para diferentes valores
% que va a tomar

c=[-0.1+0.5i,-0.7-0.3i,-0.4+0.6i,-0.65,-1]
[x,y] = meshgrid(-1.5:0.001:1.5,-1:0.001:1); %Creamos las coordinadas (x,y) definidas de [-1.5 a 1.5] y [-1 a 1]
z=x+y*1i; %Creamos el número imaginario

%Creamos la función en la cual vamos a cambiar los valores de c
%Vamos a crear el radio 

for i =1:1:length(c)
    f=@(x) x.^2+c(i);
    r=max([c,3]);
    for j=1:30
        z=f(z);
    end
    z(abs(z) >= r) = 0;
% Plot the Julia set
    contour(abs(z))
    z=x+y*1i;
    pause(1)
    axis off
end
    
    



