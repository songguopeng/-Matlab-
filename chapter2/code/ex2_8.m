load mri %载入Matlab自带的核磁共振图像
imshow(D(:,:,7), map); % 显示多幅中的一幅

% 同一窗口显示
figure, montage(D, map);

% 转化成为电影
figure
mov=immovie(D, map);
colormap(map); %设定颜色表
movie(mov); %播放电影
