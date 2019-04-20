% Laplacian��LoG���ӵ���Ч���Ƚ�

I = imread('../babyNew.bmp');
figure, imshow(I, []); %�õ�ͼ5.14��a��
Id = double(I); % �˲�ǰת��Ϊ˫������
h_lap = [-1 -1 -1; -1 8 -1; -1 -1 -1] %������˹����
I_lap = imfilter(Id, h_lap, 'corr', 'replicate'); % Laplacian��
figure, imshow(uint8(abs(I_lap)), []); % ȡ����ֵ����255���ϵ���Ӧ�ض�, %�õ�ͼ5.14��b��

h_log = fspecial('log', 5, 0.5); % ��СΪ5��sigma=0.5��LoG����
I_log = imfilter(Id, h_log, 'corr', 'replicate'); 
figure, imshow(uint8(abs(I_log)), []);%�õ�ͼ5.14��c��

h_log = fspecial('log', 5, 2); % ��СΪ5��sigma=2��LoG����
I_log = imfilter(Id, h_log, 'corr', 'replicate'); 
figure, imshow(uint8(abs(I_log)), []);%�õ�ͼ5.14��d��
