function [submuestreada] = submuestreo(imagen, resolution)
%submuestreo Combierte imagen al formato escala de grises y cambia su
%resoluci�n a la representado por el vector resolution [alto ancho] en
%p�xeles

    imagen = rgb2ycbcr(imagen);
    submuestreada = imagen(:,:,1);
    submuestreada = imresize(submuestreada,resolution);
end

