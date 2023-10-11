function [ok] = rafaga_object(vid,number,mov,img1,img2,img_prev,tags,sizes)
%RAFAGA Almacena una r�faga de number im�gnes junto a las im�genes de la
%detecci�n.
%   La funci�n captura una r�faga de im�genes, crea(si no existe) la
%   carpeta /ALERTAS en el directorio de ejecuci�n y almacena en esta las
%   im�genes capturadas m�s las im�genes causantes de la detecci�n en una
%   nueva carpeta que contiene la fecha y hora de la detecci�n.
%   Par�etros de entrada
%   -----------------------
%
%   vid                 Objeto del v�deo con el que se realiza la captura
%                       de im�genes con la funci�n getsnapshot().
%                       
%   number              Entero con el n�mero de im�genes a capturar y
%                       almacenar.
%
%   mov                 Matriz de movimiento d�nde semarca las posiciones
%                       en las que se ha detectado el movimiento en el paso
%                       de la img a la img2.
%
%   img1,img2           Im�genes que se introdujeron en el detector que
%                       activ� a alerta.
%
%   img_prev            Imagen capturada previamente a la detecci�n del
%                       movimiento.
%
%   tags/sizes          Argumentos opcionales con una matriz de etiquetas
%                       a partir de la cual se guarda una imagen indicando
%                       en rojo, azul y verde los 3 objetos de mayor tama�o
%                       encontrados as� como el centro de masas del objeto
%                       mayor. EL vector sizes indica el tama�o de cada
%                       objeto con el fin de mostrar los objetos por
%                       tama�o.


    DateString = datestr(datetime('now'));
    [status,msg] = mkdir('ALERTAS',replace(DateString,':','-'));
    for i=1:number
        baseFileName = sprintf('Image #%d.png', i);
        fullFileName = fullfile(strcat('ALERTAS/',replace(DateString,':','-')), baseFileName);
        img= getsnapshot(vid);
        imwrite(img, fullFileName);
    end
    resolution = size(img2,1:2);
    img_superponer =imresize(mov,resolution,"Method","nearest").*50;%Pinta de rojo levemente los bloques activados
    img_detec = img2;
    img_detec(:,:,1) = img_detec(:,:,1) + img_superponer;
    fullFileName = fullfile(strcat('ALERTAS/',replace(DateString,':','-')), 'Movimiento.png');
    imwrite(img_detec, fullFileName);
    fullFileName = fullfile(strcat('ALERTAS/',replace(DateString,':','-')), 'Detect1.png');
    imwrite(img1, fullFileName);
    fullFileName = fullfile(strcat('ALERTAS/',replace(DateString,':','-')), 'Detect2.png');
    imwrite(img2, fullFileName);
    fullFileName = fullfile(strcat('ALERTAS/',replace(DateString,':','-')), 'PreDetection.png');
    imwrite(img_prev, fullFileName);
    

    if nargin == 8
        %Almacenar tambi�n indicador del objeto que se ha detectado si se
        %introducen los argumentos necesarios
        im_object=img2;
        im_object(:,:,1) = im_object(:,:,1) +80.*imresize(uint8(tags==1),size(img2,1:2));
        im_object(:,:,2) = im_object(:,:,2) +80.*imresize(uint8(tags==2),size(img2,1:2));
        im_object(:,:,3) = im_object(:,:,3) +80.*imresize(uint8(tags==3),size(img2,1:2));
        pos = regionprops(true(size(tags)), tags, 'WeightedCentroid').WeightedCentroid;
        position = [pos(1)*size(img2,2)/size(tags,2) pos(2)*size(img2,1)/size(tags,1)];
        im_object_marker = insertMarker(im_object,position,'*','Size',20);

        fullFileName = fullfile(strcat('ALERTAS/',replace(DateString,':','-')), 'Objeto_marcado.png');
        imwrite(im_object_marker, fullFileName);
    end
    ok=1;
end



