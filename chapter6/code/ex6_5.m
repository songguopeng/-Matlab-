I = imread('coins.png');

% 生成滤镜
ff = imgaussfhpf (I, 20);
% 应用滤镜
out = imfreqfilt(I, ff);

figure (1);
subplot(2,2,1);
imshow(I);
title('Source');

% 计算FFT并显示
temp = fft2(double(I));
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure (2);
subplot(2,2,1);
imshow(temp, []);
title('Source');

figure (1);
subplot(2,2,2);
imshow(out);
title('Gauss HPF, sigma=20');

% 计算FFT并显示
temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure (2);
subplot(2,2,2);
imshow(temp, []);
title(' Gauss HPF, sigma=20');

% 生成滤镜
ff = imgaussfhpf (I, 40);
% 应用滤镜
out = imfreqfilt(I, ff);

figure (1);
subplot(2,2,3);
imshow(out);
title('Gauss HPF, sigma =40');

% 计算FFT并显示
temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure (2);
subplot(2,2,3);
imshow(temp, []);
title(' Gauss HPF, sigma =40');

% 生成滤镜
ff = imgaussfhpf (I, 60);
% 应用滤镜
out = imfreqfilt(I, ff);

figure (1);
subplot(2,2,4);
imshow(out);
title('Gauss HPF, sigma =60');

% 计算FFT并显示
temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure (2);
subplot(2,2,4);
imshow(temp, []);
title(' Gauss HPF, sigma =60');
