I = imread('../head_portrait.bmp'); %读入原图像
figure, imshow(I); %得到图10.18(a)中的图像
se = strel('square', 3); %3*3的正方形结构元素
Ie = imerode(I, se); %腐蚀得到内部点
Iout = I - Ie; %减去内部点留下边界点
figure, imshow(Iout); %得到图10.18(b)中的图像
