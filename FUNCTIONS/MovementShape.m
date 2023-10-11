function [moving, counter, MSEmatrix] = MovementShape(img1, img2, grid, blocksize)
%Movement Shape calcula el MSE por bloques de blocksize p�xeles y conforma la
%imagen moving que es completamente blanca a execpci�n de las zonas d�nde
%los bloques han superado el l�mite de MSE impuesto por grid
if mod(size(img1,1),blocksize)~= 0
    disp('ERROR - Tama�o de bloque o de im�genes no consistente')
    return
end
moving=uint8(zeros(size(img1,1:2)/blocksize));
MSEmatrix=zeros(size(moving));
grid = imresize(grid, [(size(img1,1)/blocksize) (size(img1,2)/blocksize)],"Method","nearest");
counter=0;


for i=1:(size(img1,1)/blocksize)
    for j=1:(size(img1,2)/blocksize)
        
        %Extraer subim�genes 10x10
        subimg1=img1((i-1)*10+1:i*10,(j-1)*10+1:j*10,:);
        subimg2=img2((i-1)*10+1:i*10,(j-1)*10+1:j*10,:);
        err = immse(subimg1,subimg2);
        MSEmatrix(i,j)= err;
        if err > 600*grid(i,j)
            moving(i,j) = 1;%Deep black
            counter = counter + 1;
        end
    end  
end

