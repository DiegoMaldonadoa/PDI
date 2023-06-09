%% Funcion de generacion de Datos
function [data,Frontera]=generacion2clases(N, val1, val2, dclase1, dclase2)
% N: numero de muestras
% val1: distancia minima de muestra a frontera de decision
% val2: distancia maxima de muestra a frontera de decision
% dclase1: datos finales de clase 1
% dclase2: dato finales clase 2

x = linspace(-0.5,3.25,N/2);         % valores eje x
y = 1*x.^3-4*x.^2+2.5*x-5;           % polinomio

da1 = y+0.025*randi([val1,val2],1,N/2);%datos aleatorios clase 1
da2 = y-0.025*randi([val1,val2],1,N/2);%datos aleatorios clase 2

%% Matriz y datos a usar
alpha = 65.495;     %angulo a rotar
P = [x; y];      %vector que contiene punto a rotar
c1 = [x; da1];   % matriz clase 1 a rotar
c2 = [x; da2];   % matriz clase 2 a rotar
% Matriz a usar
Mz = [cosd(alpha), -sind(alpha);...
      sind(alpha), cosd(alpha)];

%% Operaciones
R = Mz*P;     %Datos de funcion rotados
Rc1 = Mz*c1;  %datos de clase 1 rotados
Rc2 = Mz*c2;  %datos de clase 2 rotados

%% Creacion de vector de etiquetas
% Para datos rotados
clase1 = [Rc1.' zeros(N/2,1)];
clase2 = [Rc2.' ones(N/2,1)];
Frontera = R';

if nargin < 4 
    data = [clase1; clase2];
elseif nargin == 4     
    erorr('Se deben ingresar el valor que se requiere para las dos clases.');
else
    % Vectores donde se almacenarán los datos finales
    nVc1 = zeros(dclase1,size(clase1,2));
    nVc2 = zeros(dclase2,size(clase2,2));
    % Escoger datos de la clase 1
    i=0;
    while i < dclase1
        j = randi(length(clase1)-i);
        nVc1(i+1,:) = clase1(j,:);
        clase1(j,:) = [];
        i = i+1;
    end
    i=0;
    % Escoger datos de la clase 1
    while i < dclase2
        j = randi(length(clase2)-i);
        nVc2(i+1,:) = clase2(j,:);
        clase2(j,:) = [];
        i = i+1;
    end

    data = [nVc1; nVc2];
end

end
