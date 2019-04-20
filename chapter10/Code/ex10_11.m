I = imread('rice.png');
subplot(2, 4, 1), imshow(I, []);%得到图10.39（a）
thresh = graythresh(I) %自适应确定阈值
Ibw = im2bw(I, thresh);
subplot(2, 4, 2), imshow(Ibw, []);%得到图10.39（b）
subplot(2, 4, 3), surf(double(I(1:8:end,1:8:end))),zlim([0 255]),colormap gray;%显示I的3维可视化效果，（c）图
bg = imopen(I,strel('disk',15));%半径为15的圆形结构元素进行灰度开运算提取背景曲面
subplot(2, 4, 4), surf(double(bg(1:8:end,1:8:end))),zlim([0 255]), colormap gray; %显示背景曲面的三维可视化效果，图10.39（d）

Itophat = imsubtract(I, bg); %顶帽变换
subplot(2, 4, 5), imshow(Itophat); %得到图10.39（e）
subplot(2, 4, 6), surf(double(Itophat(1:8:end,1:8:end))),zlim([0 255]); %显示顶帽变换图像的三维可视化效果
I2 = imadjust(Itophat);%对比度拉伸
subplot(2, 4, 7), imshow(I2); %得到图10.39（f）

thresh2 = graythresh(I2) %自适应确定阈值

Ibw2 = im2bw(I2, thresh2); %得到图10.39（g）
subplot(2, 4, 8), imshow(Ibw2); %得到图10.39（h）
