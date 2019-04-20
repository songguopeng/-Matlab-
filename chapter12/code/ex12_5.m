addpath(genpath('F:\Program Files\MATLAB\R2011a\book\chapter12\code\LBP')); %替换为您计算机中LBP工具箱所在的绝对路径
I = imread('../mh_gray.bmp'); %读入图像
histLBP1 = getLBPHist(I, 14, 13, 1); %按照14×13分区后像素块大小为1的复合LBP直方图特征
histLBP2 = getLBPHist(I, 7, 6, 2); %按照7×6分区后像素块大小为2的复合LBP直方图特征
histLBP3 = getLBPHist(I, 5, 4, 3); %按照5×4分区后像素块大小为3的复合LBP直方图特征
figure, plot(histLBP1) %得到图12.22(b)
figure, plot(histLBP2) %得到图12.22(c)
figure, plot(histLBP3) %得到图12.22(d)
