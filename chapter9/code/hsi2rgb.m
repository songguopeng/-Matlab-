function rgb = hsi2rgb(hsi)
% rgb = hsi2rgb(hsi)��һ��HSIͼ��ת��ΪRGBͼ��
% ����hsi(:, :, 1)��ɫ�ȷ��������ķ�Χ�ǳ���2*pi���[0, 1]��
% hsi(:, :, 2)�Ǳ��Ͷȷ�������Χ��[0, 1]��
% hsi(:, :, 3)�����ȷ�������Χ��[0, 1]��
%
% ���ͼ�������
% rgb(:, :, 1)Ϊ�죻
% rgb(:, :, 2)Ϊ�̣�
% rgb(:, :, 3)Ϊ����

% ��ȡͼ�����
hsi = im2double(hsi);
H = hsi(:, :, 1) * 2 * pi;
S = hsi(:, :, 2);
I = hsi(:, :, 3);

% ִ��ת������
R = zeros(size(hsi, 1), size(hsi, 2));
G = zeros(size(hsi, 1), size(hsi, 2));
B = zeros(size(hsi, 1), size(hsi, 2));

% RG����(0 <= H < 2*pi/3)
idx = find( (0 <= H) & (H < 2*pi/3));
B(idx) = I(idx) .* (1 - S(idx));
R(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./ ...
cos(pi/3 - H(idx)));
G(idx) = 3*I(idx) - (R(idx) + B(idx));

% BG����(2*pi/3 <= H < 4*pi/3)
idx = find( (2*pi/3 <= H) & (H < 4*pi/3) );
R(idx) = I(idx) .* (1 - S(idx));
G(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 2*pi/3) ./ ...
cos(pi - H(idx)));
B(idx) = 3*I(idx) - (R(idx) + G(idx));

% BR����
idx = find( (4*pi/3 <= H) & (H <= 2*pi));
G(idx) = I(idx) .* (1 - S(idx));
B(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 4*pi/3) ./ ...
cos(5*pi/3 - H(idx)));
R(idx) = 3*I(idx) - (G(idx) + B(idx));

% ��3���������ϳ�Ϊһ��RGBͼ��
rgb = cat(3, R, G, B);
rgb = max(min(rgb, 1), 0);
