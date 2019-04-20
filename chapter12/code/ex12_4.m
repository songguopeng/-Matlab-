addpath(genpath('F:\Program Files\MATLAB\R2011a\book\chapter12\code\LBP')); %替换为您计算机中LBP工具箱所在的绝对路径
I = imread('../mh_gray.bmp'); %读入图像

[hist1, I_LBP1] = getMBLBPFea(I, 1);
[hist2, I_LBP2] = getMBLBPFea(I, 2);
[hist3, I_LBP3] = getMBLBPFea(I, 3);
figure, imshow(I_LBP1, []) %得到图12.21(b)
figure, imshow(I_LBP2, []) %得到图12.21(c)
figure, imshow(I_LBP3, []) %得到图12.21(d)
