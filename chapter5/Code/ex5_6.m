% ����Sobel�ݶȵ�ͼ����

I = imread('../bacteria.bmp'); %����ԭͼ��
w1 = fspecial('sobel') %�õ�ˮƽsobelģ��
w2 = w1' %ת�õõ���ֱsobleģ��
G1 =  imfilter(I, w1); %ˮƽSobel�ݶ�
G2 =  imfilter(I, w2); %��ֱSobel�ݶ�
G = abs(G1) + abs(G2); %Sobel�ݶ�
figure, imshow(G1, []) %�õ�ͼ5.9��a��
figure, imshow(G2, []) %�õ�ͼ5.9��b��
figure, imshow(G, []) %�õ�ͼ5.9��c��
