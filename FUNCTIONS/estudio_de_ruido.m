

[vid, videosource] = config_cam(2,1);

medias=zeros(1,60);
maximas=zeros(1,60);

for i=1:30
    img1 = getsnapshot(vid);%Capturar imagen previa
    pause(0.2); % pause for T seconds
    img2 = getsnapshot(vid);%Capturar imagen previa
    pause(0.1);
    %Cálculo de matriz de MSE por bloque
    matrixMSE = MSEperBlock(img1,img2);
    maximas(i) = max(matrixMSE(:));
    medias(i)= mean(matrixMSE(:));

end
media1=mean(medias)
max1=mean(maximas)

delete(vid);
clear all

[vid, videosource] = config_cam(2,2);

medias=zeros(1,60);
maximas=zeros(1,60);

for i=1:30
    img1 = getsnapshot(vid);%Capturar imagen previa
    pause(0.2); % pause for T seconds
    img2 = getsnapshot(vid);%Capturar imagen previa
    pause(0.1);
    %Cálculo de matriz de MSE por bloque
    matrixMSE = MSEperBlock(img1,img2);
    maximas(i) = max(matrixMSE(:));
    medias(i)= mean(matrixMSE(:));

end
media2=mean(medias)
max2=mean(maximas)

delete(vid);
clear all

[vid, videosource] = config_cam(2,3);

medias=zeros(1,60);
maximas=zeros(1,60);

for i=1:30
    img1 = getsnapshot(vid);%Capturar imagen previa
    pause(0.2); % pause for T seconds
    img2 = getsnapshot(vid);%Capturar imagen previa
    pause(0.1);
    %Cálculo de matriz de MSE por bloque
    matrixMSE = MSEperBlock(img1,img2);
    maximas(i) = max(matrixMSE(:));
    medias(i)= mean(matrixMSE(:));

end
media3=mean(medias)
max3=mean(maximas)