function [data, Frontera1, Frontera2] = generacion4clases(N, c1, c2, c3, c4)
%Cuatro Clases Dos Polinomios
%%  Ingreso de datos
% N: Numero de datos
% data: datos de salida
% Frontera1: Frontera de decision de Primer polinomio
% Frontera2: Frontera de decision de Segundo polinomio
% c1: numero de muestras de clase 1
% c2: numero de muestras de clase 2
% c3: numero de muestras de clase 3
% c3: numero de muestras de clase 4

% reondeo de datos
n = N*8;

p = 100;
q = 0.25;
x = linspace(-8,8,n/4);
%% Creacion de Frontera de decision
y1 = -0.00005*x.^3-0.0001*x.^2+3*x+0.03; %primer polinomio
y2 = 0.001*x.^5+0.00001*x.^4-0.1*x.^3+0.1*x.^2-0.1*x+0.03; %segundo polinomio

Frontera1 = [x; y1]';
Frontera2 = [x; y2]';

c1_y1 = y1+q*randi([1,p],1,length(x));%datos aleatorios clase 1
c2_y1 = y1-q*randi([1,p],1,length(x));%datos aleatorios clase 2

c1_y2 = y2+q*randi([1,p],1,length(x));%datos aleatorios clase 3
c2_y2 = y2-q*randi([1,p],1,length(x));%datos aleatorios clase 4

% Asignacion de clases 
clase1 = [x.' c1_y1.'  zeros(n/4,1)];
clase2 = [x.' c2_y1.'  ones(n/4,1)];
clase3 = [x.' c1_y2.'  2*ones(n/4,1)];
clase4 = [x.' c2_y2.'  3*ones(n/4,1)];

% Creacion de matriz que incluyen todos los datos
data = [clase1; clase2; clase3; clase4];

% Separacion en clases
for i = 1:n/4
    if (c1_y1(i) > y1(i)) && (c1_y1(i) > y2(i))
        data(i,3) = 0;
    end
    if (c1_y2(i) > y1(i)) && (c1_y2(i) > y2(i))
        data(n/2+i,3) = 0;
    end
    if (c2_y1(i) < y1(i)) && (c2_y1(i) < y2(i))
        data(n/4+i,3) = 1;
    end
    if (c2_y2(i) < y1(i)) && (c2_y2(i) < y2(i))
        data(n*3/4+i,3) = 1;
    end
end

for i=1:n/8
    if (c1_y1(i) > y1(i)) && (c1_y1(i) < y2(i))
        data(i,3) = 2;
    end
    if (c2_y1(n/8+i) > y2(n/8+i)) && (c2_y1(n/8+i) < y1(n/8+i))
        data(n*3/8+i,3) = 3;
    end
    if (c2_y2(i) < y2(i)) && (c2_y2(i) > y1(i))
        data(n*3/4+i,3) = 2;
    end
    if (c1_y2(n/8+i) > y2(n/8+i)) && (c1_y2(n/8+i) < y1(n/8+i))
        data(n*5/8+i,3) = 3;
    end
end
% si no se agregan numero para clase todas tendrn la misma cantidad de
% muestras
if nargin < 3
    c1 = round(N/4);
    c2 = round(N/4);
    c3 = round(N/4);
    c4 = round(N/4);
end

clase1 = data(data(:,3) == 0,:);
clase2 = data(data(:,3) == 1,:);
clase3 = data(data(:,3) == 2,:);
clase4 = data(data(:,3) == 3,:);

% inicializacion de vectores
nVc1 = zeros(c1,size(clase1,2));
nVc2 = zeros(c2,size(clase2,2));
nVc3 = zeros(c3,size(clase3,2));
nVc4 = zeros(c4,size(clase4,2));
% extraer datos de clase 1
i = 0;
while i < c1
    j = randi(length(clase1)-i);
    nVc1(i+1,:) = clase1(j,:);
    clase1(j,:) = [];
    i = i+1;
end
% extraer datos de clase 2
i=0;
while i < c2
    j = randi(length(clase2)-i);
    nVc2(i+1,:) = clase2(j,:);
    clase2(j,:) = [];
    i = i+1;
end
% extraer datos de clase 3
i=0;
while i < c3
    j = randi(length(clase3)-i);
    nVc3(i+1,:) = clase3(j,:);
    clase3(j,:) = [];
    i = i+1;
end
% extraer datos de clase 4
i=0;
while i < c4
    j = randi(length(clase4)-i);
    nVc4(i+1,:) = clase4(j,:);
    clase4(j,:) = [];
    i = i+1;
end

data = [nVc1; nVc2; nVc3; nVc4];

end
