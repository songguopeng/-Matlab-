function I_out = imMove(I, Tx, Ty)
% ƽ�Ʊ任
% ���룺I - ����ͼ��
%      Tx - ˮƽ����ƽ����
%      Ty - ��ֱ����ƽ����
% �����I_out - ���ͼ��


tform = maketform('affine',[1 0 0;0 1 0; Tx Ty 1]);
%����ƽ�Ʊ任����

I_out = imtransform(I,tform,'XData',[1 size(I,2)],'YData',[1 size(I,1)]); %ͼ��ƽ��

subplot(1,2,1),imshow(I);
title('ԭͼ��');
subplot(1,2,2),imshow(I_out);
title('ƽ��ͼ��');
