% Laplacian与LoG算子的锐化效果比较

I = imread('../babyNew.bmp');
figure, imshow(I, []); %得到图5.14（a）
Id = double(I); % 滤波前转化为双精度型
h_lap = [-1 -1 -1; -1 8 -1; -1 -1 -1] %拉普拉斯算子
I_lap = imfilter(Id, h_lap, 'corr', 'replicate'); % Laplacian锐化
figure, imshow(uint8(abs(I_lap)), []); % 取绝对值并将255以上的响应截断, %得到图5.14（b）

h_log = fspecial('log', 5, 0.5); % 大小为5，sigma=0.5的LoG算子
I_log = imfilter(Id, h_log, 'corr', 'replicate'); 
figure, imshow(uint8(abs(I_log)), []);%得到图5.14（c）

h_log = fspecial('log', 5, 2); % 大小为5，sigma=2的LoG算子
I_log = imfilter(Id, h_log, 'corr', 'replicate'); 
figure, imshow(uint8(abs(I_log)), []);%得到图5.14（d）
