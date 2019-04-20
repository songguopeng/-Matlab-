% 均值滤波

f = imread('../fatBaby.bmp'); %读入图像
imshow(f); %得到图5.2（a）的图像
w = [1 1 1; 1 1 1; 1 1 1] / 9 %滤波模板

g = imfilter(f, w, 'corr', 'replicate'); %滤波
figure, imshow(g); %得到5.2（b）的图像

