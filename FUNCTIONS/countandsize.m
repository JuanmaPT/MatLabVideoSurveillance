function [L, num,sizes] = countandsize(image)
%countandsize cuenta y calcula tama�o de objetos en imagen
%   Esta funci�n toma como entrada una imagen en BLANCO Y NEGRO en la que
%   las partes blancas se definen como objetos en la imagen.Se aplica un
%   filtrado espacial para eliminar ruido o huecos y calcula el n�mero de
%   objetos presentes. 
%       L .......... Matriz de etiquetas de objetos
%       num ........ N�mero de objetos encontrados
%       sizes ...... Tama�o del objeto en re�aci�n a imagen(tanto por uno)

    se=strel('disk',2);%Elemento de estructuraci�n plana, disco de radio 2
    afterOpening=imopen(image,se);
    afterClosing=imclose(afterOpening,se);
    [L,num]=bwlabel(afterOpening,4);
    NumTotal=numel(L);
    sizes=zeros(1,num);
    for i=1:num
        sizes(i)=(sum(sum(L==i)))/(NumTotal);
    end
    
end

