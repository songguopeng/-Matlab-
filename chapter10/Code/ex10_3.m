I = zeros(120, 180);
I(11:80, 16:75) = 1;
I(56:105, 86:135) = 1;
I(26:55, 141:170) = 1;
figure, imshow(I); %�õ�ͼ10.16(a)
 
% ���ɽṹԪ��S
se = zeros(58, 58);
se(5:54, 5:54) = 1; % ����S1
figure, imshow(se); %�õ�ͼ10.16(b) 

% ���л����б任
Ie1 = imerode(I, se); % ���帯ʴ
figure, imshow(Ie1); %�õ�ͼ10.16(c)
Ic = 1-I; % I�Ĳ�
figure, imshow(Ic); %�õ�ͼ10.16(d)
S2 = 1-se;
figure, imshow(S2); %�õ�ͼ10.16(e)
Ie2 = imerode(Ic, S2); % ������ʴ %�õ�ͼ10.16(f)
Ihm = Ie1 & Ie2; % ���θ�ʴ�Ľ���
figure, imshow(Ihm); %�õ�ͼ10.16(g)
