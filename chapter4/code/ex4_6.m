% 插值算法比较

A=imread('../rectangle.bmp'); %读入本章的示例矩形图片

B = imrotate(A,30,'nearest');
C = imrotate(A,30,'bilinear');
D = imrotate(A,30,'bicubic');
%图像旋转30°的插值方法比较
subplot(2,2,1),imshow(A);
title('原图像');
subplot(1,3,1),imshow(B);
title('最近邻插值');
subplot(1,3,2),imshow(C);
title('双线性插值');
subplot(1,3,3),imshow(D);
title('双三次插值');
