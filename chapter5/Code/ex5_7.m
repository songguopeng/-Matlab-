% ����3��������˹ģ����˲� 

I = imread('../bacteria.bmp');
figure, imshow(I); %�õ�ͼ5.9��a��
I = double(I);
w1 = [0 -1 0; -1 4 -1; 0 -1 0]
L1 = imfilter(I, w1, 'corr', 'replicate');
w2 = [-1 -1 -1; -1 8 -1; -1 -1 -1]
L2 = imfilter(I, w2, 'corr', 'replicate');
figure, imshow(abs(L1), []);%�õ�ͼ5.9��b��
figure, imshow(abs(L2), []);%�õ�ͼ5.9��c��
w3 = [1 4 1; 4 -20 4; 1 4 1]
L3 = imfilter(I, w3, 'corr', 'replicate');
figure, imshow(abs(L3), []);%�õ�ͼ5.9��d��
