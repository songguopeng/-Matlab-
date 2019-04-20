function yuv = rgb2yuv(rgb)
% yuv = rgb2yuv(rgb)��һ��RGBͼ��ת��ΪYUVͼ��
% ����ͼ����һ����ɫ���ص�M��N��3�����飬
% ����ÿһ����ɫ���ض����ض��ռ�λ�õĲ�ɫͼ���ж�Ӧ�졢�̡�������������
% �������е�RGB�����Ǿ���ģ���ôHSIת������δ����ġ�
% ����ͼ�������double��ȡֵ��Χ��[0, 1]����uint8�� uint16��
%
% ���YUVͼ����uint8��
rgb = im2double(rgb);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

% ִ��ת������
y = 0.299*r + 0.587*g + 0.114*b;
u = 0.567*(b - y);
v = 0.713*(r - y);

% ��ֹ���
if(y < 0)
    y = 0;
end;
if(y > 1.0)
    y = 1.0;
end;
if(u < 0)
    u = 0;
end;
if(u > 1.0)
    u = 1.0;
end;
if(v < 0)
    v = 0;
end;
if(v > 1.0)
    v = 1.0;
end;
    
% ����yuv����ת��uint8����
y = y*255;
u = u*255;
v = v*255;
yuv = cat(3, y, u, v);
yuv = uint8(yuv);
