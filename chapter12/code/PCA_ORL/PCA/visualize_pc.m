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
   error('ֻ������ʾ 20 �����ɷ�');
end;

figure
img = zeros(row, col);
for ii = 1:20
    img(:) = E(:, ii);
    subplot(4, 5, ii);
    imshow(img, []);
end

