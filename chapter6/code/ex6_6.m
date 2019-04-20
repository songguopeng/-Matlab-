I = imread('coins.png');

ff = imlapf (I);
out = imfreqfilt(I, ff);

figure (1);
subplot(1,2,1);
imshow(I);
title('Source');

temp = fft2(double(I));
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure (2);
subplot(1,2,1);
imshow(temp, []);
title('Source');

figure (1);
subplot(1,2,2);
imshow(out);
title('Laplace Filter');

temp = fft2(out);
temp = fftshift(temp);
temp = log(1 + abs(temp));
figure (2);
subplot(1,2,2);
imshow(temp, []);
title('Laplace Filter');
