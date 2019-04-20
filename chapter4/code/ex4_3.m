% 图像转置

A=imread('pout.tif');
tform = maketform('affine',[0 1 0;1 0 0; 0 0 1]);
%定义转置变换矩阵
B = imtransform(A,tform,'nearest');
subplot(1,2,1),imshow(A);
title('原图像');
subplot(1,2,2),imshow(B);
title('图像转置');
