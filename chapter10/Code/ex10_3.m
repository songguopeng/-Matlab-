I = zeros(120, 180);
I(11:80, 16:75) = 1;
I(56:105, 86:135) = 1;
I(26:55, 141:170) = 1;
figure, imshow(I); %得到图10.16(a)
 
% 生成结构元素S
se = zeros(58, 58);
se(5:54, 5:54) = 1; % 物体S1
figure, imshow(se); %得到图10.16(b) 

% 击中击不中变换
Ie1 = imerode(I, se); % 物体腐蚀
figure, imshow(Ie1); %得到图10.16(c)
Ic = 1-I; % I的补
figure, imshow(Ic); %得到图10.16(d)
S2 = 1-se;
figure, imshow(S2); %得到图10.16(e)
Ie2 = imerode(Ic, S2); % 背景腐蚀 %得到图10.16(f)
Ihm = Ie1 & Ie2; % 两次腐蚀的交集
figure, imshow(Ihm); %得到图10.16(g)
