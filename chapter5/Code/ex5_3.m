 I = imread('../baby_noise.bmp');
 figure, imshow(I); %得到图5.5（a）中的图像

 h3_5 = fspecial('gaussian', 3, 0.5); % sigma=0.5的3*3高斯模板
 I3_5 = imfilter(I, h3_5); % 高斯平滑
 figure, imshow(I3_5); %得到图5.5（b）中的图像
 
 h3_8 = fspecial('gaussian', 3, 0.8); % sigma=0.8的3*3高斯模板
 I3_8 = imfilter(I, h3_8);
 figure, imshow(I3_8); %得到图5.5（c）中的图像

 h3_18 = fspecial('gaussian', 3, 1.8) % sigma=1.8的3*3高斯模板，接近于平均模板

 I3_18 = imfilter(I, h3_18);
 figure, imshow(I3_18); %得到图5.5（d）中的图像
 
 h5_8 = fspecial('gaussian', 5, 0.8);
 I5_8 = imfilter(I, h5_8);
 figure, imshow(I5_8); %得到图5.5（e）中的图像
 imwrite(I5_8, 'baby5_8.bmp');

 h7_12 = fspecial('gaussian', 7, 1.2);
 I7_12 = imfilter(I, h7_12);
 figure, imshow(I7_12); %得到图5.5（f）中的图像
 imwrite(I7_12, 'baby7_12.bmp');

