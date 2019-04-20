I = imread('../baby_noise.bmp'); 
figure, imshow(I) %得到图5.3（a）中的图像
h = fspecial('average', 3); % 3*3平均模板
I3 = imfilter(I, h, 'corr', 'replicate'); % 相关滤波，重复填充边界
figure, imshow(I3) %得到图5.3（b）中的图像
h = fspecial('average', 5) % 5*5平均模板

I5 = imfilter(I, h, 'corr', 'replicate');
figure, imshow(I5) %得到图5.3（c）中的图像
h = fspecial('average', 7); % 7*7平均模板
I7 = imfilter(I, h, 'corr', 'replicate');
figure, imshow(I7) %得到图5.3（d）中的图像

