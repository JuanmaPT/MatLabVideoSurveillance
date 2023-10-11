%Implementaci�n del sistema sin interfaz
%======================================================================
%     1.-  CONFIGURACI�N DE LA C�MARA
%======================================================================
list_cameras
prompt = '\nSelecciona una c�mara : ';
selected_camera = input(prompt);
prompt = '\nSelecciona la calidad 1(baja), 2(media) y 3(alta)) : ';
quality = input(prompt);

[vid, videosource] = config_cam(selected_camera,quality);

% preview(vid);
% prompt = '\n Orienta la c�mara para obtner el encuadre deseado, deja la c�mara est�tica y pulsa enter';
% none = input(prompt);
% closepreview(vid);

grid=[ones(size(img1,1)/10,size(img1,2)/(10*2))*1e18 ones(size(img1,1)/10,size(img1,2)/(10*2))*2000;];%Detectar en mitad
grid=[ones(size(img1,1)/10,size(img1,2)/10)*1000];%Detectar completa
blocksize=10;

%while 1
    img1 = getsnapshot(vid);%Capturar imagen previa
    pause(1); % pause for T seconds
    img2 = getsnapshot(vid);%Capturar imagen previa
    
    

    [moving, counter] = MovementShape(img1, img2, grid, blocksize);
    %C�lculo de matriz de MSE por bloque
    matrixMSE = MSEperBlock(img1,img2);
    maxMSE = max(matrixMSE(:))
    meanMSE= mean(matrixMSE(:))
    actived_blocks= sum(sum(counter))
    


    
delete(vid);
