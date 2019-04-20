I = imread('gantrycrane.png'); %读入Matlab自带图像
% 显示图像
imshow(I);
% 写回到文件
imwrite(I, 'gantrycrane.tif', 'TIFF');
