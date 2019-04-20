I = imread('../bw_bacteria.bmp');  % 读入二值化后的细菌图像
figure, imshow(I) % 得到(b)图
[L, num] = bwlabel(I, 8); % 直接统计（b）中连通区个数
num % 显示细菌个数，由于“断裂”存在，比实际数目多1
Idil = imdilate(I, ones(3,3)); % 采用3×3的结构元素膨胀
figure, imshow(Idil) % 得到(c)图
[L, num] = bwlabel(Idil, 8); % 统计（c）中的连通区个数
num % 实际的细菌个数
