I = imread('../bw_bacteria.bmp');  % �����ֵ�����ϸ��ͼ��
figure, imshow(I) % �õ�(b)ͼ
[L, num] = bwlabel(I, 8); % ֱ��ͳ�ƣ�b������ͨ������
num % ��ʾϸ�����������ڡ����ѡ����ڣ���ʵ����Ŀ��1
Idil = imdilate(I, ones(3,3)); % ����3��3�ĽṹԪ������
figure, imshow(Idil) % �õ�(c)ͼ
[L, num] = bwlabel(Idil, 8); % ͳ�ƣ�c���е���ͨ������
num % ʵ�ʵ�ϸ������
