% locateMouth.m

I = imread('mouth.bmp'); %����ͼ��
Id = im2double(I);
figure, imshow(Id) % �õ�8.24(a)
Ibw = im2bw(Id, 0.38); % ��0.38Ϊ��ֵ��ֵ��
Ibw = 1 - Ibw; %Ϊ��Matlab�н��д�����ͼ��ɫ
figure, imshow(Ibw) % �õ�8.24(b)
hold on
[L, num] = bwlabel(Ibw, 8); % ��ע��ͨ����
disp(['ͼ�й���' num2str(num) '����ͨ����'])
 
% �ҳ�������ͨ�������죩
max = 0; % ��ǰ�����ͨ�����Ĵ�С
indMax = 0; % ��ǰ�����ͨ����������
for k = 1:num
    [y x] = find(L == k); % �ҳ����Ϊk����ͨ��������������y������������x
    
    nSize = length(y); %�������ͨ���е�������Ŀ
    if(nSize > max)
        max = nSize;
        indMax = k;
    end
end
 
if indMax == 0
    disp('û���ҵ���ͨ����')
    return
end
 
% ���㲢��ʾ�����ͨ�������죩������
[y x] = find(L == indMax);
yMean = mean(y);
xMean = mean(x);
plot(xMean, yMean, 'Marker', 'o', 'MarkerSize', 14, 'MarkerEdgeColor', 'w', 'MarkerFaceColor', 'w');
plot(xMean, yMean, 'Marker', '*', 'MarkerSize', 12, 'MarkerEdgeColor', 'k'); % �õ�8.24(c)
