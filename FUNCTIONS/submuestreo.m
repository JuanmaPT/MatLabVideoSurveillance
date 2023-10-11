function [submuestreada] = submuestreo(imagen, resolution)
%submuestreo Combierte imagen al formato escala de grises y cambia su
%resolución a la representado por el vector resolution [alto ancho] en
%píxeles

    imagen = rgb2ycbcr(imagen);
    submuestreada = imagen(:,:,1);
    submuestreada = imresize(submuestreada,resolution);
end

