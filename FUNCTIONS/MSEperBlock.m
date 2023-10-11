function [matrix] = MSEperBlock(img1, img2)
%MSE grid Summary of this function goes here
%   Detailed explanation goes here
matrix=zeros(size(img1,1)/10,size(img1,2)/10);
for i=1:size(img1,1)/10
    for j=1:size(img1,2)/10
        %Extraer subimágenes 10x10
        subimg1=img1((i-1)*10+1:i*10,(j-1)*10+1:j*10,:);
        subimg2=img2((i-1)*10+1:i*10,(j-1)*10+1:j*10,:);
        matrix(i,j) = immse(subimg1,subimg2);
    end
end