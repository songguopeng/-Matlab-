function face=ReadAFace(dir)

% ����ָ��Ŀ¼����һ������
% 
% ����:  --dir:��������ͼ���·��
% 
% ���:   --face:������,����img�����ذ��д洢

img=imread(dir);
[imgRow,imgCol]=size(img);
face=zeros(1, imgRow*imgCol);

face = img(:)';
