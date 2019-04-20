function Icorr = dftcorr(I, w)
% function Icorr = dftcorr(I, w)
% ��Ƶ���¼���ͼ�� I ����ģʽ w �������Ӧ������ʾ������Ӧλ��
% 
% Input��I - ԭʼͼ��
%        w - ��ͼ��
%
% Output��Icorr - ��Ӧͼ��
I = double(I);
[m n] = size(I);
[m0 n0] = size(w);
F = fft2(I);
w = conj(fft2(w, m, n)); %w Ƶ�׵Ĺ���
Ffilt = w .* F; %Ƶ���˲����
Icorr = real(ifft2(Ffilt)); %���任�ؿ���


% �ҵ�������Ӧλ��
[iMaxRes, jMaxRes] = find(Icorr == max( Icorr(:) ) );
figure, imshow(I, []);
hold on
for ii = 1:length(iMaxRes)
    plot(jMaxRes(ii), iMaxRes(ii), 'w*');
    plot([jMaxRes(ii), jMaxRes(ii)+n0-1], [iMaxRes(ii), iMaxRes(ii)], 'w-' );
    plot([jMaxRes(ii)+n0-1, jMaxRes(ii)+n0-1], [iMaxRes(ii), iMaxRes(ii)+m0-1], 'w-' );
    plot([jMaxRes(ii), jMaxRes(ii)+n0-1], [iMaxRes(ii)+m0-1, iMaxRes(ii)+m0-1], 'w-' );
    plot([jMaxRes(ii), jMaxRes(ii)], [iMaxRes(ii), iMaxRes(ii)+m0-1], 'w-' );
end