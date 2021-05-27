classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                 matlab.ui.Figure
        UIAxes                   matlab.ui.control.UIAxes
        UIAxes2                  matlab.ui.control.UIAxes
        SeleccionarPuntoButton   matlab.ui.control.Button
        GraficarPuntoButton      matlab.ui.control.Button
    end
    properties (Access=private)
        x_1;
        y_1;
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button
        function SeleccionarPuntoButtonPushed(app, event)
rad= 0.4;
%Radio Circulos PequeÃ±os
rad_2 = 0.01;
%Vector con 600 puntos de 0 a 2pi
Teta = linspace(0,2*pi, 400);
X = [];
Y = [];
for i = 1:7
    % Generacion del Circulo
    x = rad*cos(Teta);
    y = rad*sin(Teta);
    
    % sobre el anterior circulo se hacen mas circulos
    for j = 1:20:length(x)
        x1 = rad_2*cos(Teta) + x(j);
        y1 = rad_2*sin(Teta) + y(j);
        %Elimina el cambio de posicion que hay entre los circulos
        X(length(X)+1) = NaN;
        Y(length(Y)+1) = NaN;
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

plot(X, Y, 'b')
grid on
xlim([-1 1])
ylim([-1 1])
xlabel('Eje Real')
ylabel('Eje Imaginario')
title('Plano Complejo Circulos')
[app.x_1 app.y_1]=ginput(1)
plot(app.x_1,app.y_1,'r*')
            
        end

        % Button pushed function: Button2
        function GraficarPuntoButtonPushed(app, event)
            rad= 0.4;
%Radio Circulos PequeÃ±os
rad_2 = 0.01;
%Vector con 600 puntos de 0 a 2pi
Teta = linspace(0,2*pi, 400);
X = [];
Y = [];
for i = 1:7
    % Generacion del Circulo
    x = rad*cos(Teta);
    y = rad*sin(Teta);
    
    % sobre el anterior circulo se hacen mas circulos
    for j = 1:20:length(x)
        x1 = rad_2*cos(Teta) + x(j);
        y1 = rad_2*sin(Teta) + y(j);
        %Elimina el cambio de posicion que hay entre los circulos
        X(length(X)+1) = NaN;
        Y(length(Y)+1) = NaN;
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
title('Proyección Estereográfica Circulos')
axis equal

Z_1=complex(app.x_1, app.y_1)

    norm1 = sqrt((real(Z_1)).^2+(imag(Z_1)).^2);
    norm_21 = norm1.^2;
    X11 = 2.*real(Z_1)./((norm_21)+1);
    X21 = 2.*imag(Z_1)./((norm_21)+1);
    X31 = ((norm_21)-1)./((norm_21)+1);
    
scatter3(X11,X21,X31,'r')

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Plano Complejo')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.Position = [274 268 300 185];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.UIFigure);
            title(app.UIAxes2, 'Esfera de Riemann')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            app.UIAxes2.Position = [274 35 300 185];

            % Create Button
            %app.Button = uibutton(app.UIFigure, 'push');
            %app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            %app.Button.Position = [40 349 100 22];
            app.SeleccionarPuntoButton = uibutton(app.UIFigure, 'push');
            app.SeleccionarPuntoButton.ButtonPushedFcn = createCallbackFcn(app, @SeleccionarPuntoButtonPushed, true);
            app.SeleccionarPuntoButton.Position = [33.5 349 113 22];
            app.SeleccionarPuntoButton.Text = 'Seleccionar Punto';

            % Create Button2
            %app.Button2 = uibutton(app.UIFigure, 'push');
            %app.Button2.ButtonPushedFcn = createCallbackFcn(app, @Button2Pushed, true);
            %app.Button2.Position = [40 116 100 22];
            %app.Button2.Text = 'Button2';
            
            app.GraficarPuntoButton = uibutton(app.UIFigure, 'push');
            app.GraficarPuntoButton.ButtonPushedFcn = createCallbackFcn(app, @GraficarPuntoButtonPushed, true);
            app.GraficarPuntoButton.Position = [40 116 100 22];
            app.GraficarPuntoButton.Text = 'Graficar Punto';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end