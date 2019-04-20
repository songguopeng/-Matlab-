I = imread('../erode_dilate.bmp'); %读入8位灰度图像
%二值形态学处理中将灰度图像中所有非0值都看作是1，即前景物体

figure, imshow(I); %得到图10.6(a)
se = strel('square', 3) %3*3的正方形结构元素
Ib= imerode(I, se); %腐蚀
figure, imshow(Ib); %得到图10.6(b)
se = strel([0 1 0; 1 1 1; 0 1 0]) %3*3的十字结构元素
Ic= imerode(I, se); %腐蚀
figure, imshow(Ic); %得到图10.6(c)
se = strel('square', 5) ;%5*5的正方形结构元素
Id= imerode(I, se); %腐蚀
figure, imshow(Id); %得到图10.6(d)
se = strel('square', 6); %6*6的正方形结构元素
Ie= imerode(I, se); %腐蚀
figure, imshow(Ie); %得到图10.6(e)
se = strel('square', 7) ;%7*7的正方形结构元素
If= imerode(I, se); %腐蚀
figure, imshow(If); %得到图10.6(f)
