function I_out = imMove(I, Tx, Ty)
% 平移变换
% 输入：I - 输入图像
%      Tx - 水平方向平移量
%      Ty - 竖直方向平移量
% 输出：I_out - 输出图像


tform = maketform('affine',[1 0 0;0 1 0; Tx Ty 1]);
%定义平移变换矩阵

I_out = imtransform(I,tform,'XData',[1 size(I,2)],'YData',[1 size(I,1)]); %图像平移

subplot(1,2,1),imshow(I);
title('原图像');
subplot(1,2,2),imshow(I_out);
title('平移图像');
