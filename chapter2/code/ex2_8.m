load mri %����Matlab�Դ��ĺ˴Ź���ͼ��
imshow(D(:,:,7), map); % ��ʾ����е�һ��

% ͬһ������ʾ
figure, montage(D, map);

% ת����Ϊ��Ӱ
figure
mov=immovie(D, map);
colormap(map); %�趨��ɫ��
movie(mov); %���ŵ�Ӱ
