[vid, videosource] = config_cam(1,3,'YCbCr');
res_cap = vid.VideoResolution;
res_pro = [240 320];
sens = 1000;
blocksize=10;%Tamaño de bloque de 10*10
grid = generategrid(res_pro, blocksize, sens, 'complete');

previousmovement=0;
movement_bool=0;
movement=0;

img1=getsnapshot(vid);
while 1
    pause(0.2);
    img2= getsnapshot(vid);
    img1sub = submuestreo(img1, res_pro);
    img2sub = submuestreo(img2, res_pro);

    [moving, counter, MSEmatrix, overlaysimple] = MovementShape(img1sub, img2sub, grid, blocksize);
    if counter > 0 && counter < (numel(moving)-200)
        [L, num,sizes] = countandsize(moving);
        if(num > 0) && max(sizes) > 0.2
            disp(['Se ha detectado un objeto grande que ocupa el ', num2str( max(sizes)*100), '% de la imagen'])
            if movement_bool == 1
                [M,I]=max(sizes);
                I=I(1);
                movement= uint8(imresize(L==I,10).*255);
                [vector,overlay] = vector_movimiento(previousmovement,movement,img2sub);
                figure(7);
                imshow(overlay);
                hold on;
                flecha(vector);
            else
                figure(7);
                imshow(overlaysimple);
            end       
%             almacenar_rafaga;
            movement_bool=1;
            previousmovement = movement;
        else
            movement_bool=0;
        end 
    end
    img1=img2;
end

delete(vid);


