I = imread('../erode_dilate.bmp'); %����8λ�Ҷ�ͼ��
%��ֵ��̬ѧ�����н��Ҷ�ͼ�������з�0ֵ��������1����ǰ������

figure, imshow(I); %�õ�ͼ10.6(a)
se = strel('square', 3) %3*3�������νṹԪ��
Ib= imerode(I, se); %��ʴ
figure, imshow(Ib); %�õ�ͼ10.6(b)
se = strel([0 1 0; 1 1 1; 0 1 0]) %3*3��ʮ�ֽṹԪ��
Ic= imerode(I, se); %��ʴ
figure, imshow(Ic); %�õ�ͼ10.6(c)
se = strel('square', 5) ;%5*5�������νṹԪ��
Id= imerode(I, se); %��ʴ
figure, imshow(Id); %�õ�ͼ10.6(d)
se = strel('square', 6); %6*6�������νṹԪ��
Ie= imerode(I, se); %��ʴ
figure, imshow(Ie); %�õ�ͼ10.6(e)
se = strel('square', 7) ;%7*7�������νṹԪ��
If= imerode(I, se); %��ʴ
figure, imshow(If); %�õ�ͼ10.6(f)
