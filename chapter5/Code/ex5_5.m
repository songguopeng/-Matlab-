% 基于Robert交叉梯度的图像锐化

I = imread('../bacteria.bmp');
imshow(I); % 显示图5.7(a)
I = double(I); % 转换为double型，这样可以保存负值，否则uint8型会把负值截掉
w1 = [-1 0; 0 1]
w2 = [0 -1; 1 0]
G1 =  imfilter(I, w1, 'corr', 'replicate'); % 以重复方式填充边界
G2 =  imfilter(I, w2, 'corr', 'replicate');
G = abs(G1) + abs(G2); % 计算Robert梯度 
figure, imshow(G, []); % 显示图5.7(b)
figure, imshow(abs(G1), []); % 显示图5.7(c)
figure, imshow(abs(G2), []); % 显示图5.7(d)
