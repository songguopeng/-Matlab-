I = imread('../bw_mouth.bmp'); %�����ֵͼ���ļ�bw_mouth.bmpλ�ڸ������̵�12�µĸ�Ŀ¼��
Il = bwlabel(I); %��ע��ͨ�����õ���Ǿ���Il
D = regionprops(Il, 'area', 'centroid'); %��ȡ���������
D % �鿴���صĽṹ��
D.Area % 4����ͨ��������
v1 = [D.Area] % �����ת��Ϊ����
D.Centroid % 4����ͨ���������
v2 = [D.Centroid] %������ת��Ϊ����
