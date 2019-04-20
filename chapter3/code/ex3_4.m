I = imread('pout.tif'); %����ԭͼ��
I1 = imread('coins.png'); %����Ҫƥ��ֱ��ͼ��ͼ��
I2 = imread('circuit.tif'); %����Ҫƥ��ֱ��ͼ��ͼ��

% ����ֱ��ͼ
[hgram1, x] = imhist(I1);
[hgram2, x] = imhist(I2);

% ִ��ֱ��ͼ���⻯
J1=histeq(I,hgram1);
J2=histeq(I,hgram2);

% ��ͼ
subplot(2,3,1);
imshow(I);title('ԭͼ');
subplot(2,3,2);
imshow(I1); title('��׼ͼ1');
subplot(2,3,3);
imshow(I2); title('��׼ͼ2');
subplot(2,3,5);
imshow(J1); title('�涨����1')
subplot(2,3,6);
imshow(J2);title('�涨����2');

% ��ֱ��ͼ
figure;

subplot(2,3,1);
imhist(I);title('ԭͼ');

subplot(2,3,2);
imhist(I1); title('��׼ͼ1');

subplot(2,3,3);
imhist(I2); title('��׼ͼ2');

subplot(2,3,5);
imhist(J1); title('�涨����1')

subplot(2,3,6);
imhist(J2);title('�涨����2');
