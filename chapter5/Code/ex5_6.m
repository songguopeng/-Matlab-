% 基于Sobel梯度的图像锐化

I = imread('../bacteria.bmp'); %读入原图像
w1 = fspecial('sobel') %得到水平sobel模板
w2 = w1' %转置得到竖直soble模板
G1 =  imfilter(I, w1); %水平Sobel梯度
G2 =  imfilter(I, w2); %竖直Sobel梯度
G = abs(G1) + abs(G2); %Sobel梯度
figure, imshow(G1, []) %得到图5.9（a）
figure, imshow(G2, []) %得到图5.9（b）
figure, imshow(G, []) %得到图5.9（c）
