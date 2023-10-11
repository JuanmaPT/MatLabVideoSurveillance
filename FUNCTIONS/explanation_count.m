%% =======================================
%Explicación de la función countandsize
%=========================================
subplot(3,2,1);
imshow(img1);
title('Imagen anterior');
subplot(3,2,2);
imshow(img2);
title('Imagen actual');
img1sub = img1;
img2sub = img2;


[moving,counter,MSE] = MovementShape(img1sub, img2sub, [2], 10);
figure(1)
subplot(3,2,3);
imshow(moving*255);
title('moving');

se=strel('disk',2);%Elemento de estructuración plana, disco de radio 2
afterOpening=imopen(moving*255,se);
subplot(3,2,4);
imshow(afterOpening);
title('Erosión');

afterClosing=imclose(afterOpening,se);
subplot(3,2,5);
imshow(afterClosing);
title('Dilatación');


[L,num]=bwlabel(afterClosing,4);
im_show=uint8(ones(size(img2)))*150;
im_show(:,:,2) = im_show(:,:,2) +220.*imresize(uint8(L==1),size(img2,1:2));
subplot(3,2,6);
imshow(im_show,[0 4]);
title(['bwlabel']);

pos = regionprops(true(size(L)), L, 'WeightedCentroid').WeightedCentroid;
im_show=img2;
im_show(:,:,1) = im_show(:,:,1) +220.*imresize(uint8(L==1),size(img2,1:2));
position = [pos(1)*size(img2,2)/size(moving,2) pos(2)*size(img2,1)/size(moving,1)];


figure(2);
imshow(insertMarker(im_show,position,'*','Size',20));
