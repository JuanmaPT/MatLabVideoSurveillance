function [vector, x , y] = vector_movimiento(move1,move2)
%vector_movimiento Devuelve el vector que une los centros de masas de los
%objetos presentes en mov1 y move2.
%   La funci�n se nutre de regionprops que mide propiedades de una zona de
%   componentes conectados(objetos en la imagen de movimiento). As� se
%   obtiene los centros de masas de cada imagen y, mediante aritm�tica
%   b�sica calcula el vector que une los puntos.
    
    x = regionprops(true(size(move1)), move1, 'WeightedCentroid').WeightedCentroid;
    y = regionprops(true(size(move2)), move2, 'WeightedCentroid').WeightedCentroid;
    
    vector = y-x;%Llevando punto de inicio del vector al origen O(0,0)
    
end

