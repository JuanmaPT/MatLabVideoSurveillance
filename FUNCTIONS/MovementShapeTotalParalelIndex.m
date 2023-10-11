function [moving, counter, MSEmatrix] = MovementShapeTotalParalelIndex(img1, img2, grid, blocksize)
    %Movement Shape calcula el MSE por bloques de blocksize píxeles y conforma la
    %imagen moving que es completamente cero a execpción de las zonas dónde
    %los bloques han superado el límite de MSE impuesto por grid donde es 1
%     if mod(size(img1,1),blocksize)~= 0
%         disp('ERROR - Tamaño de bloque o de imágenes no consistente')
%         return
%     end

    moving=uint8(zeros(1,size(img1,1)*size(img1,2)/100));
    MSEmatrix=zeros(size(moving));
    grid=reshape(grid,1,[]);

    %  Preprocesado para paralelizar proceso
    IM1 = mat2cell(img1, ones(1,size(img1,1)/10)*10, ones(1,size(img1,2)/10)*10);%Subsivisión matrices
    IM2 = mat2cell(img2, ones(1,size(img2,1)/10)*10, ones(1,size(img2,2)/10)*10);
%     IM1 = reshape(IM1,1,[]);
%     IM2 = reshape(IM2,1,[]);
    counter = 0;
    
    
    xdim=size(img1,1)/10;
    ydim=size(img1,2)/10;
    s_last=size(img1,1)*size(img1,2)/100;

    parfor s=1:s_last
%         fila = floor(s,ydim)+1;
%         columna = mod(s,xdim)+1;
        
        err = immse(IM1{floor(s,ydim)+1,mod(s,xdim)},IM2{floor(s,ydim)+1,mod(s,xdim)});
        MSEmatrix(s)= err;
        if err > grid(s)
            moving(s) = 1;%BLoque activado
            counter = counter + 1;
        end
    end
    moving=reshape(moving,size(img1,1)/blocksize,size(img1,2)/blocksize);
    MSEmatrix=reshape(MSEmatrix,size(img1,1)/10,size(img1,2)/10);
end