I = imread('../head_portrait.bmp'); %����ԭͼ��
figure, imshow(I); %�õ�ͼ10.18(a)�е�ͼ��
se = strel('square', 3); %3*3�������νṹԪ��
Ie = imerode(I, se); %��ʴ�õ��ڲ���
Iout = I - Ie; %��ȥ�ڲ������±߽��
figure, imshow(Iout); %�õ�ͼ10.18(b)�е�ͼ��
