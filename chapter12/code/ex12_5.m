addpath(genpath('F:\Program Files\MATLAB\R2011a\book\chapter12\code\LBP')); %�滻Ϊ���������LBP���������ڵľ���·��
I = imread('../mh_gray.bmp'); %����ͼ��
histLBP1 = getLBPHist(I, 14, 13, 1); %����14��13���������ؿ��СΪ1�ĸ���LBPֱ��ͼ����
histLBP2 = getLBPHist(I, 7, 6, 2); %����7��6���������ؿ��СΪ2�ĸ���LBPֱ��ͼ����
histLBP3 = getLBPHist(I, 5, 4, 3); %����5��4���������ؿ��СΪ3�ĸ���LBPֱ��ͼ����
figure, plot(histLBP1) %�õ�ͼ12.22(b)
figure, plot(histLBP2) %�õ�ͼ12.22(c)
figure, plot(histLBP3) %�õ�ͼ12.22(d)
