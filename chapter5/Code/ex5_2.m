I = imread('../baby_noise.bmp'); 
figure, imshow(I) %�õ�ͼ5.3��a���е�ͼ��
h = fspecial('average', 3); % 3*3ƽ��ģ��
I3 = imfilter(I, h, 'corr', 'replicate'); % ����˲����ظ����߽�
figure, imshow(I3) %�õ�ͼ5.3��b���е�ͼ��
h = fspecial('average', 5) % 5*5ƽ��ģ��

I5 = imfilter(I, h, 'corr', 'replicate');
figure, imshow(I5) %�õ�ͼ5.3��c���е�ͼ��
h = fspecial('average', 7); % 7*7ƽ��ģ��
I7 = imfilter(I, h, 'corr', 'replicate');
figure, imshow(I7) %�õ�ͼ5.3��d���е�ͼ��

