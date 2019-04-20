I = imread('pout.tif'); % 读取图像

% 在不同窗口显示
figure; %创建一个新的窗口
imshow(I); 
figure; 
imshow(I, [ ]);
% 在相同窗口显示
figure;
subplot(1, 2,1); 
imshow(I); 
subplot(1,2,2); 
imshow(I, [ ]);
