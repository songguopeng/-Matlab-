I = imread('../lena_salt.bmp');
imshow(I); %�õ�ͼ5.6��a����ͼ��
J=imnoise(I,'salt & pepper');%Ϊͼ����ӽ�������
figure, imshow(J); %�õ�ͼ5.6��b����ͼ��
w = [1 2 1;2 4 2;1 2 1] / 16;
J1=imfilter(J, w, 'corr', 'replicate'); %��˹ƽ��
figure, imshow(J1); %�õ�ͼ5.6��c����ͼ��
w = [1 1 1;1 1 1;1 1 1] / 9;
J2=imfilter(J, w, 'corr', 'replicate');%ƽ��ƽ��
figure, imshow(J2); %�õ�ͼ5.6��d����ͼ��
J3=medfilt2(J,[3,3]);%��ֵ�˲�
figure, imshow(J3); %�õ�ͼ5.6��e����ͼ��
