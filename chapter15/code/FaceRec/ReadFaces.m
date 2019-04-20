function [imgRow,imgCol,FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson, nPerson, bTest)
% ����ORL�������ָ����Ŀ������ǰǰ����(ѵ��)
%
% ���룺nFacesPerPerson --- ÿ������Ҫ�������������Ĭ��ֵΪ 5
%       nPerson --- ��Ҫ�����������Ĭ��Ϊȫ�� 40 ����
%       bTest --- bool�͵Ĳ�����Ĭ��Ϊ0����ʾ����ѵ��������ǰ5�ţ������Ϊ1����ʾ���������������5�ţ�
%
% �����FaceContainer --- ����������������nPerson * 10304 �� 2 ά����ÿ�ж�Ӧһ����������

if nargin==0 %default value
    nFacesPerPerson=5;%ǰ5������ѵ��
    nPerson=40;%Ҫ�����������ÿ�˹�10�ţ�ǰ5������ѵ����
    bTest = 0;
elseif nargin < 3
    bTest = 0;
end

img=imread('Data/ORL/S1/1.pgm');%Ϊ����ߴ��ȶ���һ��
[imgRow,imgCol]=size(img);


FaceContainer = zeros(nFacesPerPerson*nPerson, imgRow*imgCol);
faceLabel = zeros(nFacesPerPerson*nPerson, 1);

% ����ѵ������
for i=1:nPerson
    i1=mod(i,10); % ��λ
    i0=char(i/10);
    strPath='Data/ORL/S';
    if( i0~=0 )
        strPath=strcat(strPath,'0'+i0);
    end
    strPath=strcat(strPath,'0'+i1);
    strPath=strcat(strPath,'/');
    tempStrPath=strPath;
    for j=1:nFacesPerPerson
        strPath=tempStrPath;
        
        if bTest == 0 % ����ѵ������
            strPath = strcat(strPath, '0'+j);
        else
            strPath = strcat(strPath, num2str(5+j));
        end
        
        strPath=strcat(strPath,'.pgm');
        img=imread(strPath);
       
        %�Ѷ����ͼ���д洢Ϊ������������������������faceContainer�Ķ�Ӧ����
        FaceContainer((i-1)*nFacesPerPerson+j, :) = img(:)';
        faceLabel((i-1)*nFacesPerPerson+j) = i;
    end % j
end % i

% ����������������
save('Mat/FaceMat.mat', 'FaceContainer')




