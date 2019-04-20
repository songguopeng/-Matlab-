 I = imread('../baby_noise.bmp');
 figure, imshow(I); %�õ�ͼ5.5��a���е�ͼ��

 h3_5 = fspecial('gaussian', 3, 0.5); % sigma=0.5��3*3��˹ģ��
 I3_5 = imfilter(I, h3_5); % ��˹ƽ��
 figure, imshow(I3_5); %�õ�ͼ5.5��b���е�ͼ��
 
 h3_8 = fspecial('gaussian', 3, 0.8); % sigma=0.8��3*3��˹ģ��
 I3_8 = imfilter(I, h3_8);
 figure, imshow(I3_8); %�õ�ͼ5.5��c���е�ͼ��

 h3_18 = fspecial('gaussian', 3, 1.8) % sigma=1.8��3*3��˹ģ�壬�ӽ���ƽ��ģ��

 I3_18 = imfilter(I, h3_18);
 figure, imshow(I3_18); %�õ�ͼ5.5��d���е�ͼ��
 
 h5_8 = fspecial('gaussian', 5, 0.8);
 I5_8 = imfilter(I, h5_8);
 figure, imshow(I5_8); %�õ�ͼ5.5��e���е�ͼ��
 imwrite(I5_8, 'baby5_8.bmp');

 h7_12 = fspecial('gaussian', 7, 1.2);
 I7_12 = imfilter(I, h7_12);
 figure, imshow(I7_12); %�õ�ͼ5.5��f���е�ͼ��
 imwrite(I7_12, 'baby7_12.bmp');

