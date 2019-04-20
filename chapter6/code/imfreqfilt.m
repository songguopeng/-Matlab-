function out = imfreqfilt(I, ff)
% imfreqfilt����			�ԻҶ�ͼ�����Ƶ���˲�
% ����I				����Ŀ���ͼ��
% ����ff				Ӧ�õ���ԭͼ��ȴ��Ƶ���˾�

if (ndims(I)==3) && (size(I,3)==3)   % RGBͼ��
    I = rgb2gray(I);
end

if (size(I) ~= size(ff))
    msg1 = sprintf('%s: �˾���ԭͼ�񲻵ȴ󣬼������', mfilename);
    msg2 = sprintf('%s: �˲������Ѿ�ȡ��', mfilename);
    eid = sprintf('Images:%s:ImageSizeNotEqual',mfilename);
    error(eid,'%s %s',msg1,msg2);
end

% ���ٸ���Ҷ�任
f = fft2(double(I));

% �ƶ�ԭ��
s = fftshift(f);

% Ӧ���˾������任
out = s .* ff; %��ӦԪ�����ʵ��Ƶ���˲�
out = ifftshift(out);
out = ifft2(out);

% ��ģֵ
out = abs(out);

% ��һ���Ա���ʾ
out = out/max(out(:));