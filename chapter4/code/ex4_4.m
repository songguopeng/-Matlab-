% Í¼ÏñËõ·Å

A = imread('pout.tif');
B = imresize(A,1.2,'nearest');
%Í¼ÏñÀ©´ó1.2±¶
figure,imshow(A);title('Ô­Í¼Ïñ');
figure,imshow(B);title('Í¼ÏñËõ·Å');
