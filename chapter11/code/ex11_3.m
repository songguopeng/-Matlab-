I1 = imread('rice.png'); %����ԭͼ��
imshow(I1)

%ѡȡ��ֵΪ0.2����ԭʼͼ������Ĳ����ֽ�
S = qtdecomp(I1,0.2);
%ԭʼ��ϡ�����ת��Ϊ��ͨ����ʹ��full����
S2 = full(S);	

figure;	
imshow(S2); 

ct = zeros(6, 1); %��¼�ӿ���Ŀ��������

% �ֱ��ò�ͬ��С�����Ϣ���ӿ����ݱ�������ά����vals1~val6�У��ӿ���Ŀ������ct������
for ii = 1:6
	 [vals{ii},r,c] = qtgetblk(I1,S2,2^(ii-1));
	ct(ii) = size(vals{ii},3);
end
