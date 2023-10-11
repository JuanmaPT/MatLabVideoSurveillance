function [L, num,sizes] = countandsize(image)
%countandsize cuenta y calcula tamaño de objetos en imagen
%   Esta función toma como entrada una imagen en BLANCO Y NEGRO en la que
%   las partes blancas se definen como objetos en la imagen.Se aplica un
%   filtrado espacial para eliminar ruido o huecos y calcula el número de
%   objetos presentes. 
%       L .......... Matriz de etiquetas de objetos
%       num ........ Número de objetos encontrados
%       sizes ...... Tamaño del objeto en reñación a imagen(tanto por uno)

    se=strel('disk',2);%Elemento de estructuración plana, disco de radio 2
    afterOpening=imopen(image,se);
    afterClosing=imclose(afterOpening,se);
    [L,num]=bwlabel(afterOpening,4);
    NumTotal=numel(L);
    sizes=zeros(1,num);
    for i=1:num
        sizes(i)=(sum(sum(L==i)))/(NumTotal);
    end
    
end

