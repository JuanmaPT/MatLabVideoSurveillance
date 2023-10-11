img = getsnapshot(app.video_object);
img_resized = imresize(img,app.res_display);
img_back=img_resized;

colorA = [255, 255, 0]; % amarillo
colorB = [255, 0, 0]; % rojo




color_matrix = zeros(size(app.grid_small,1),size(app.grid_small,2),3);
for i=1:size(color_matrix,1)
    for j=1:size(color_matrix,2)
        if app.grid_small(i,j) ~= 0
%             color_matrix(i,j,:) = colorA + (app.grid_small(i,j)/(600*100)).*(colorB - colorA);
            img_back( (i-1)*20+1:(i-1)*20+20,(j-1)*20+1:(j-1)*20+20,1)...
                = uint8((colorA(1) + (app.grid_small(i,j)/(10)).*(colorB(1) - colorA(1))).*ones(20:20)/2) ...
                +uint8(img_resized( (i-1)*20+1:(i-1)*20+20,(j-1)*20+1:(j-1)*20+20,1)/2);
            img_back( (i-1)*20+1:(i-1)*20+20,(j-1)*20+1:(j-1)*20+20,2)...
                = uint8((colorA(2) + (app.grid_small(i,j)/(10)).*(colorB(2) - colorA(2))).*ones(20:20)/2) ...
                +uint8(img_resized( (i-1)*20+1:(i-1)*20+20,(j-1)*20+1:(j-1)*20+20,2)/2);
            img_back( (i-1)*20+1:(i-1)*20+20,(j-1)*20+1:(j-1)*20+20,3)...
                = uint8((colorA(3) + (app.grid_small(i,j)/(10)).*(colorB(3) - colorA(3))).*ones(20:20)/2) ...
                +uint8(img_resized( (i-1)*20+1:(i-1)*20+20,(j-1)*20+1:(j-1)*20+20,3)/2);
        end
    end
end

img_back = uint8(img_back);
I = imshow(img_back, 'Parent', app.UIAxes);