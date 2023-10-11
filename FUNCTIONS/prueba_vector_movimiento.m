grid=[ones(size(imagen_vacia,1)/10,size(imagen_vacia,2)/10)*1000];%Detectar completa
blocksize=10;%Tamaño de bloque de 10*10
[moving, counter, MSEmatrix] = MovementShape(imagen_vacia, imagen_objeto1, grid, blocksize);
[L, num,sizes] = countandsize(moving);
[M,I]=max(sizes)
I=I(1);
object = uint8(imresize(L==I,10).*255);

props1 = regionprops(true(size(object)), object, 'WeightedCentroid')

h=figure(1)
subplot(1,3,1);
overlay = object(:,:,[1 1 1])./4;
imshow(imagen_objeto1 + overlay);
axis on
hold on;
% Plot cross at row 100, column 50
plot(props1.WeightedCentroid(1), props1.WeightedCentroid(2) , 'r+', 'MarkerSize', 30, 'LineWidth', 2);


[moving, counter, MSEmatrix] = MovementShape(imagen_vacia, imagen_objeto2, grid, blocksize);
[L, num,sizes] = countandsize(moving);
[M,I]=max(sizes)
I=I(1);
object2 = uint8(imresize(L==I,10).*255);

props2 = regionprops(true(size(object2)), object2, 'WeightedCentroid')
subplot(1,3,2);
overlay = object2(:,:,[1 1 1])./4;
imshow(imagen_objeto2 + overlay);
axis on
hold on;

% Plot cross at row 100, column 50
plot(props2.WeightedCentroid(1), props2.WeightedCentroid(2) , 'r+', 'MarkerSize', 30, 'LineWidth', 2);

subplot(1,3,3);
imshow(imagen_objeto2);
hold on;
drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0,'color',[1 0 0] )    

x1 = [props1.WeightedCentroid(1) props2.WeightedCentroid(1)];
y1 = [props1.WeightedCentroid(2) props2.WeightedCentroid(2)];

drawArrow(x1,y1); hold on
axis on
hold on;

