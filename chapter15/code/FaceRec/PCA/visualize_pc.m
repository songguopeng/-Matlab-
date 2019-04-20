function visualize_pc(E)
% ��ʾ���ɷַ��������ɷ��������任�ռ��еĻ�������
%
% ���룺E --- ����ÿһ����һ�����ɷַ���


[size1 size2] = size(E);
global imgRow;
global imgCol;
row = imgRow;
col = imgCol;

if size2 ~= 20
   error('Can only display 20 principle components');
end;

c1 = zeros(row,col*5);
c2 = c1;
c3 = c1;
c4 = c1;
c1(:) = E(:,1:5);
c2(:) = E(:,6:10);
c3(:) = E(:,11:15);
c4(:) = E(:,16:20);
size(c1)

composite=zeros(row*4,col*5);
composite(:)=[c1;c2;c3;c4];

figure;
colormap(gray);
imagesc(composite);   
axis image;
m=min(min(composite));
M =max(max(composite));
imwrite(uint8((composite-m)*(255/(M-m))),'composite.tiff');
