I = imread('../starcraft.bmp'); %����ͼ��
figure, imshow(I); %�õ�ͼ10.10(a)
Ie1 = imerode(I, [1 1 1; 1 1 1; 1 1 1]) ; %3*3�����νṹԪ�صĸ�ʴ
figure, imshow(Ie1);  %�õ�ͼ10.10(b)
Ie2 = imerode(Ie1, [0 1 0; 1 1 1; 0 1 0]);  %3*3ʮ���νṹԪ�صĸ�ʴ
figure, imshow(Ie2);  %�õ�ͼ10.10(c)
Id1 = imdilate(Ie2, [1 1 1; 1 1 1; 1 1 1]);  %3*3�����νṹԪ�ص�����
figure, imshow(Id1);  %�õ�ͼ10.10(d)
Id2 = imdilate(Id1, [1 1 1; 1 1 1; 1 1 1]);  %3*3�����νṹԪ�ص�����
figure, imshow(Id2);  %�õ�ͼ10.10(e)
Id3 = imdilate(Id2, [0 1 0; 1 1 1; 0 1 0]);
figure, imshow(Id3); %�õ�ͼ10.10(f) %3*3ʮ���νṹԪ�ص�����
