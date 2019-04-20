I1 = imread('cell.tif');  %读入原图像

fcoef = fft2(double(I1)); %做fft变换 
spectrum = fftshift(fcoef); %将零点移到中心
temp =log(1+abs(spectrum)); %对幅值做对数变换以压缩动态范围

subplot(1,2,1);
imshow(temp,[]);
title('FFT');
subplot(1,2,2);
imshow(I1);
title('Source')

I2 = imread('circuit.tif');  %读入原图像

fcoef = fft2(double(I2)); %做fft变换 
spectrum = fftshift(fcoef); %将零点移到中心
temp =log(1+abs(spectrum)); %对幅值做对数变换以压缩动态范围

figure;
subplot(1,2,1);
imshow(temp,[]);
title('FFT');
subplot(1,2,2);
imshow(I2);
title('Source')
