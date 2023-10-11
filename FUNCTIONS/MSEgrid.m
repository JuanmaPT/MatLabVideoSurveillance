function [moving] = MovementShape(img1, img2, grid, blocksize)
%Movement Shape calcula el MSE por bloques de 10x10 píxeles y conforma la
%imagen moving que es completamente blanca a execpción de las zonas dónde
%los bloques han superado el límite de MSE impuesto por grid
if mod(size(img1,1),blocksize)!= 0 | mod(size(img1,2),blocksize)!= 0 | size(img1)!= size(img2)
    disp('ERROR - Tamaño de bloque o de imágenes no consistente')
    return
end
moving=ones(size(img1,1:2)/blocksize)*255;
parfor i=1:size(img1,1)/blocksize
    parfor j=1:size(img1,2)/blocksize
        %Extraer subimágenes 10x10
        subimg1=img1((i-1)*10+1:i*10,(j-1)*10+1:j*10,:);
        subimg2=img2((i-1)*10+1:i*10,(j-1)*10+1:j*10,:);
        err = immse(subimg1,subimg2);
        if err > grid(i,j)
            moving(i,j) = 0;%Deep black
        end
    end
end

