% ����任

A=imread('pout.tif');
[height,width,dim]=size(A);
tform = maketform('affine',[-1 0 0;0 1 0; width 0 1]);
%����ˮƽ����任����
B = imtransform(A,tform,'nearest');
tform2 = maketform('affine',[1 0 0;0 -1 0; 0 height 1]);
%������ֱ����任����
C = imtransform(A,tform2,'nearest');
subplot(1,3,1),imshow(A);
title('ԭͼ��');
subplot(1,3,2),imshow(B);
title('ˮƽ����');
subplot(1,3,3),imshow(C);
title('��ֱ����');
