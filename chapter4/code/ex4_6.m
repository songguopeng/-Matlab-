% ��ֵ�㷨�Ƚ�

A=imread('../rectangle.bmp'); %���뱾�µ�ʾ������ͼƬ

B = imrotate(A,30,'nearest');
C = imrotate(A,30,'bilinear');
D = imrotate(A,30,'bicubic');
%ͼ����ת30��Ĳ�ֵ�����Ƚ�
subplot(2,2,1),imshow(A);
title('ԭͼ��');
subplot(1,3,1),imshow(B);
title('����ڲ�ֵ');
subplot(1,3,2),imshow(C);
title('˫���Բ�ֵ');
subplot(1,3,3),imshow(D);
title('˫���β�ֵ');
