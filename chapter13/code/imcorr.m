function Icorr = imcorr(I, w)
% function Icorr = imcorr(I, w, )
% ����ͼ�� I ����ģʽ w �������Ӧ������ʾ������Ӧλ��
% 
% Input��I - ԭʼͼ��
%        w - ��ͼ��
%
% Output��Icorr - ��Ӧͼ��

[m, n] = size(I);
[m0, n0] = size(w);

Icorr = zeros(m-m0+1, n-n0+1); %Ϊ��Ӧͼ�����ռ�

vecW = double( w(:) ); %���д洢Ϊ����
normW = norm(vecW); %ģʽͼ���Ӧ������ģ

for ii = 1:m-m0+1
    for jj = 1:n-n0+1
        subMat = I(ii:ii+m0-1, jj:jj+n0-1);
        vec = double( subMat(:) ); %���д洢Ϊ����
        Icorr(ii, jj) = vec' * vecW / (norm(vec)*normW+eps); %���㵱ǰλ�õ����
    end
end

% �ҵ��������Ӧλ��
[iMaxRes, jMaxRes] = find(Icorr == max( Icorr(:) ) );
figure, imshow(I);
hold on
for ii = 1:length(iMaxRes)
    plot(jMaxRes(ii), iMaxRes(ii), 'w*');
    plot([jMaxRes(ii), jMaxRes(ii)+n0-1], [iMaxRes(ii), iMaxRes(ii)], 'w-' );
    plot([jMaxRes(ii)+n0-1, jMaxRes(ii)+n0-1], [iMaxRes(ii), iMaxRes(ii)+m0-1], 'w-' );
    plot([jMaxRes(ii), jMaxRes(ii)+n0-1], [iMaxRes(ii)+m0-1, iMaxRes(ii)+m0-1], 'w-' );
    plot([jMaxRes(ii), jMaxRes(ii)], [iMaxRes(ii), iMaxRes(ii)+m0-1], 'w-' );
end