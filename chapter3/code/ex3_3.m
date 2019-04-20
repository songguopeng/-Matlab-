I = imread('pout.tif'); %读入原图像
I = im2double(I);

% 对于对比度变大的图像
I1 = 2 * I - 55/255;
subplot(4,4,1);
imshow(I1);
subplot(4,4,2);
imhist(I1);
subplot(4,4,3);
imshow(histeq(I1));
subplot(4,4,4);
imhist(histeq(I1));

% 对于对比度变小的图像
I2 = 0.5 * I + 55/255;
subplot(4,4,5);
imshow(I2);
subplot(4,4,6);
imhist(I2);
subplot(4,4,7);
imshow(histeq(I2));
subplot(4,4,8);
imhist(histeq(I2));

% 对于线性增加亮度的图像
I3 = I + 55/255;
subplot(4,4,9);
imshow(I3);
subplot(4,4,10);
imhist(I3);
subplot(4,4,11);
imshow(histeq(I3));
subplot(4,4,12);
imhist(histeq(I3));

% 对于线性减小亮度的图像
I4 = I - 55/255;
subplot(4,4,13);
imshow(I4);
subplot(4,4,14);
imhist(I4);
subplot(4,4,15);
imshow(histeq(I4));
subplot(4,4,16);
imhist(histeq(I4));
