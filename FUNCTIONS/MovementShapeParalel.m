function [moving, counter, MSEmatrix] = MovementShapeParalel(img1, img2, grid, blocksize)
    %Movement Shape calcula el MSE por bloques de blocksize píxeles y conforma la
    %imagen moving que es completamente blanca a execpción de las zonas dónde
    %los bloques han superado el límite de MSE impuesto por grid
    if mod(size(img1,1),blocksize)~= 0
        disp('ERROR - Tamaño de bloque o de imágenes no consistente')
        return
    end

    moving=uint8(zeros(size(img1,1:2)/blocksize));
    MSEmatrix=zeros(size(moving));
    grid = imresize(grid, [(size(img1,1)/blocksize) (size(img1,2)/blocksize)],"Method","nearest");

    %  Preprocesado para paralelizar proceso

    MOV = mat2cell(moving, [size(moving,1)/2 size(moving,1)/2], [size(moving,2)/2 size(moving,2)/2]);
    MOV = reshape(MOV,1,[]);
    MSE = mat2cell(MSEmatrix, [size(moving,1)/2 size(moving,1)/2], [size(moving,2)/2 size(moving,2)/2]);
    MSE = reshape(MSE,1,[]);

    IM1 = mat2cell(img1, [size(img1,1)/2 size(img1,1)/2], [size(img1,2)/2 size(img1,2)/2]);%Subsivisión matrices
    IM2 = mat2cell(img2, [size(img2,1)/2 size(img2,1)/2], [size(img2,2)/2 size(img2,2)/2]);
    IM1 = reshape(IM1,1,[]);
    IM2 = reshape(IM2,1,[]);

    parfor s=1:4
        for i=1:(size(img1,1)/blocksize/2)
            for j=1:(size(img1,2)/blocksize/2)

                %Extraer subimágenes 10x10
                subimg1=IM1{s}((i-1)*10+1:i*10,(j-1)*10+1:j*10,:);
                subimg2=IM2{s}((i-1)*10+1:i*10,(j-1)*10+1:j*10,:);
                err = immse(subimg1,subimg2);
                MSE{s}(i,j)= err;
                if err > grid(i,j)
                    MOV{s}(i,j) = 1;%Deep black
                end
            end
        end

    end
    moving=[MOV{1} MOV{3}; MOV{2} MOV{4}];
    MSEmatrix=[MSE{1} MSE{3}; MSE{2} MSE{4}];
    counter = sum(sum(moving));
end


