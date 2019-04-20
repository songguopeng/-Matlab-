% ex6_2.m

% ��ȡͼƬ
A = imread('../beauty.jpg');
B = imread('../cat.jpg');

% ����Ҷ�任
Af = fft2(double(A));
Bf = fft2(double(B));

% �ֱ�������׺���λ��
AfA = abs(Af);
AfB = angle(Af);

BfA = abs(Bf);
BfB = angle(Bf);

% ������λ�ײ��ؽ���������
AfR = AfA .* cos(BfB) + AfA .* sin(BfB) .* i;
BfR = BfA .* cos(AfB) + BfA .* sin(AfB) .* i;

% ����Ҷ���任
AR = abs(ifft2(AfR));
BR = abs(ifft2(BfR));

% ��ʾͼ��
subplot(2,2,1);
imshow(A);
title('��Ůԭͼ��');

subplot(2,2,2);
imshow(B);
title('è��ԭͼ��');

subplot(2,2,3);
imshow(AR, []);
title('��Ů�ķ����׺�è����λ�����');

subplot(2,2,4);
imshow(BR, []);
title('è�ķ����׺���Ů����λ�����');
