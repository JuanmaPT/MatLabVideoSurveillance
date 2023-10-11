img = getsnapshot(app.video_object);
img_resized = imresize(img,app.size_background);
img_resized(:,:,3) = img_resized(:,:,3) + uint8(100.*imresize(app.grid_small,[360 640]));
imgback = ycbcr2rgb(img_resized);
app.Image.ImageSource = imgback;