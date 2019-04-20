I = imread('../lena_salt.bmp');
imshow(I); %得到图5.6（a）的图像
J=imnoise(I,'salt & pepper');%为图像叠加椒盐噪声
figure, imshow(J); %得到图5.6（b）的图像
w = [1 2 1;2 4 2;1 2 1] / 16;
J1=imfilter(J, w, 'corr', 'replicate'); %高斯平滑
figure, imshow(J1); %得到图5.6（c）的图像
w = [1 1 1;1 1 1;1 1 1] / 9;
J2=imfilter(J, w, 'corr', 'replicate');%平均平滑
figure, imshow(J2); %得到图5.6（d）的图像
J3=medfilt2(J,[3,3]);%中值滤波
figure, imshow(J3); %得到图5.6（e）的图像
