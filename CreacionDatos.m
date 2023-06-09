%Extraccion de datos
clc, clear;
%% Creacion de datos de entrenamiento
% Creacion de datos de entrenamiento con distintos numeros de datos
train2clases_50muestras = generacion2clases(50, 1, 100);
[train2clases_100muestras, Frontera_2clases] = generacion2clases(100, 1,...
    100);
train2clases_200muestras = generacion2clases(200, 1, 100);
train2clases_500muestras = generacion2clases(500, 1, 100);
train2clases_700muestras = generacion2clases(700, 1, 100);

% Con cantidad de datos desiguales relaciones 1:2, 1:3, 1:4, 2:3
%entrenamiento = generacionDatos(10000, 1, 100);
train2clases_relacion_1a2 = generacion2clases(3000, 1, 100, 100, 200); 
train2clases_relacion_1a3 = generacion2clases(3000, 1, 100, 100, 300);
train2clases_relacion_1a4 = generacion2clases(3000, 1, 100, 100, 400);

% Cuatro clases entrenamiento con 100, 200, 500, 700
[train4clases_100muestras,Frontera1_clase4,Frontera2_clase4] = generacion4clases(100);
train4clases_200muestras = generacion4clases(200);
train4clases_500muestras = generacion4clases(500);
train4clases_700muestras = generacion4clases(700);

%% Creacion de datos de prueba
% Solo una clase y despues otra
test2clases = generacion2clases(700, 1, 100, 100, 100);

%Creacion de datos a distintas distancias de las fronteras de decision
test2clases_cerca = generacion2clases(700, 1, 10, 100, 100);

test2clases_media = generacion2clases(700, 41, 50, 100, 100);

test2clases_lejos = generacion2clases(700, 121, 130, 100, 100);

% Pruebas cuatro clases
test4clases = generacion4clases(400);

%% Archivo
filename = 'Entrenamiento.mat';
save(filename,'train2clases_50muestras','train2clases_100muestras',...
    'train2clases_200muestras','train2clases_500muestras',...
    'train2clases_700muestras','train2clases_relacion_1a2',...
    'train2clases_relacion_1a3','train2clases_relacion_1a4',...
    'train4clases_100muestras','train4clases_200muestras',...
    'train4clases_500muestras','train4clases_700muestras');
filename = 'Prueba.mat';
save(filename,'test2clases','test2clases_cerca','test2clases_media',...
'test2clases_lejos','test4clases','Frontera_2clases','Frontera1_clase4',...
'Frontera2_clase4');