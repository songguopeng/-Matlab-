function main(k)
% ORL �������ݼ������ɷַ���
%
% ���룺k --- ���� k ά

% ����ͼ��ߡ����ȫ�ֱ��� imgRow �� imgCol�������� ReadFaces �б���ֵ
global imgRow;
global imgCol;

% ����ÿ���˵�ǰ5��ͼ��
nPerson=40;
nFacesPerPerson = 5;
display('������������...');
[imgRow,imgCol,FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson,nPerson);
display('..............................');


nFaces=size(FaceContainer,1);%��������������Ŀ
display('PCA��ά...');
% LowDimFaces��200*20�ľ���, ÿһ�д���һ�����ɷ���(��40�ˣ�ÿ��5��)��ÿ����20��ά����
% W�Ƿ���任����, 10304*20 �ľ���
[LowDimFaces, W] = fastPCA(FaceContainer, 20); % ���ɷַ���PCA
visualize_pc(W);%��ʾ���ɷ���
save('Mat/LowDimFaces.mat', 'LowDimFaces');
display('���������');

