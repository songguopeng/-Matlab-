I = imread('../lena.bmp');
seHeight = strel(ones(3, 3), ones(3, 3)) % 3*3�����ε�λ�߶ȵĽṹԪ��
Idil = imdilate(I, seHeight);
Iero = imerode(I, seHeight);
subplot(1, 3, 1), imshow(I) %�õ�ͼ10.36��a��
subplot(1, 3, 2), imshow(Idil) %�õ�ͼ10.36��b��
subplot(1, 3, 3), imshow(Iero) %�õ�ͼ10.36��c��
