I = imread('coins.png');

% �����˾�
ff = imgaussfhpf (I, 20);
% Ӧ���˾�
out = imfreqfilt(I, ff);

figure (1);
subplot(2,2,1);
imshow(I);
title('Source');

% ����FFT����ʾ
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

% ����FFT����ʾ
temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure (2);
subplot(2,2,2);
imshow(temp, []);
title(' Gauss HPF, sigma=20');

% �����˾�
ff = imgaussfhpf (I, 40);
% Ӧ���˾�
out = imfreqfilt(I, ff);

figure (1);
subplot(2,2,3);
imshow(out);
title('Gauss HPF, sigma =40');

% ����FFT����ʾ
temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure (2);
subplot(2,2,3);
imshow(temp, []);
title(' Gauss HPF, sigma =40');

% �����˾�
ff = imgaussfhpf (I, 60);
% Ӧ���˾�
out = imfreqfilt(I, ff);

figure (1);
subplot(2,2,4);
imshow(out);
title('Gauss HPF, sigma =60');

% ����FFT����ʾ
temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure (2);
subplot(2,2,4);
imshow(temp, []);
title(' Gauss HPF, sigma =60');
