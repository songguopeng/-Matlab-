% ����Robert�����ݶȵ�ͼ����

I = imread('../bacteria.bmp');
imshow(I); % ��ʾͼ5.7(a)
I = double(I); % ת��Ϊdouble�ͣ��������Ա��渺ֵ������uint8�ͻ�Ѹ�ֵ�ص�
w1 = [-1 0; 0 1]
w2 = [0 -1; 1 0]
G1 =  imfilter(I, w1, 'corr', 'replicate'); % ���ظ���ʽ���߽�
G2 =  imfilter(I, w2, 'corr', 'replicate');
G = abs(G1) + abs(G2); % ����Robert�ݶ� 
figure, imshow(G, []); % ��ʾͼ5.7(b)
figure, imshow(abs(G1), []); % ��ʾͼ5.7(c)
figure, imshow(abs(G2), []); % ��ʾͼ5.7(d)
