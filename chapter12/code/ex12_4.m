addpath(genpath('F:\Program Files\MATLAB\R2011a\book\chapter12\code\LBP')); %�滻Ϊ���������LBP���������ڵľ���·��
I = imread('../mh_gray.bmp'); %����ͼ��

[hist1, I_LBP1] = getMBLBPFea(I, 1);
[hist2, I_LBP2] = getMBLBPFea(I, 2);
[hist3, I_LBP3] = getMBLBPFea(I, 3);
figure, imshow(I_LBP1, []) %�õ�ͼ12.21(b)
figure, imshow(I_LBP2, []) %�õ�ͼ12.21(c)
figure, imshow(I_LBP3, []) %�õ�ͼ12.21(d)
