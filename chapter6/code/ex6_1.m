I1 = imread('cell.tif');  %����ԭͼ��

fcoef = fft2(double(I1)); %��fft�任 
spectrum = fftshift(fcoef); %������Ƶ�����
temp =log(1+abs(spectrum)); %�Է�ֵ�������任��ѹ����̬��Χ

subplot(1,2,1);
imshow(temp,[]);
title('FFT');
subplot(1,2,2);
imshow(I1);
title('Source')

I2 = imread('circuit.tif');  %����ԭͼ��

fcoef = fft2(double(I2)); %��fft�任 
spectrum = fftshift(fcoef); %������Ƶ�����
temp =log(1+abs(spectrum)); %�Է�ֵ�������任��ѹ����̬��Χ

figure;
subplot(1,2,1);
imshow(temp,[]);
title('FFT');
subplot(1,2,2);
imshow(I2);
title('Source')
