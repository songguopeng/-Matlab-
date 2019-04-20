I = imread('rice.png');
subplot(2, 4, 1), imshow(I, []);%�õ�ͼ10.39��a��
thresh = graythresh(I) %����Ӧȷ����ֵ
Ibw = im2bw(I, thresh);
subplot(2, 4, 2), imshow(Ibw, []);%�õ�ͼ10.39��b��
subplot(2, 4, 3), surf(double(I(1:8:end,1:8:end))),zlim([0 255]),colormap gray;%��ʾI��3ά���ӻ�Ч������c��ͼ
bg = imopen(I,strel('disk',15));%�뾶Ϊ15��Բ�νṹԪ�ؽ��лҶȿ�������ȡ��������
subplot(2, 4, 4), surf(double(bg(1:8:end,1:8:end))),zlim([0 255]), colormap gray; %��ʾ�����������ά���ӻ�Ч����ͼ10.39��d��

Itophat = imsubtract(I, bg); %��ñ�任
subplot(2, 4, 5), imshow(Itophat); %�õ�ͼ10.39��e��
subplot(2, 4, 6), surf(double(Itophat(1:8:end,1:8:end))),zlim([0 255]); %��ʾ��ñ�任ͼ�����ά���ӻ�Ч��
I2 = imadjust(Itophat);%�Աȶ�����
subplot(2, 4, 7), imshow(I2); %�õ�ͼ10.39��f��

thresh2 = graythresh(I2) %����Ӧȷ����ֵ

Ibw2 = im2bw(I2, thresh2); %�õ�ͼ10.39��g��
subplot(2, 4, 8), imshow(Ibw2); %�õ�ͼ10.39��h��
