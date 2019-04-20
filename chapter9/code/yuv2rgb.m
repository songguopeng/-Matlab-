function rgb = yuv2rgb(yuv)
% yuv = rgb2yuv(rgb)��һ��RGBͼ��ת��ΪYUVͼ��
% ����ͼ����һ����ɫ���ص�M��N��3�����飬
% ����ÿһ����ɫ���ض����ض��ռ�λ�õĲ�ɫͼ���ж�Ӧ�졢�̡�������������
% �������е�RGB�����Ǿ���ģ���ôHSIת������δ����ġ�
% ����ͼ�������double��ȡֵ��Χ��[0, 1]����uint8�� uint16��
%
% ���YUVͼ����uint8��
yuv = im2double(yuv);
y = yuv(:, :, 1);
u = yuv(:, :, 2);
v = yuv(:, :, 3);

% ִ��ת������
r = y + 1.402*v;
g = y - 0.344*u - 0.714*v;
b = y + 1.772*u;

% ��ֹ���
if(r < 0)
    r = 0;
end;
if(r > 1.0)
    r = 1.0;
end;
if(g < 0)
    g = 0;
end;
if(g > 1.0)
    g = 1.0;
end;
if(b < 0)
    b = 0;
end;
if(b > 1.0)
    b = 1.0;
end;
    
% ����rgb
r = r*255;
g = g*255;
b = b*255;
rgb = cat(3, r, g, b);
rgb = uint8(rgb);
