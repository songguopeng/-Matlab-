function [ xApprox ] = approx( x, k )
% �� k �����ɷַ��������ƣ��ؽ������� x
%
% ���룺x --- ԭ�����ռ��е������������ƵĶ���
%       k --- ���ƣ��ؽ���ʹ�õ���������Ŀ
%
% �����xApprox --- �����Ľ��ƣ��ؽ���

% ���� PCA �任���� V �� ƽ���� meanVec
load Mat/PCA.mat

nLen = length(x);

xApprox = meanVec;

for ii = 1:k
    xApprox=xApprox+((x-meanVec)*V(:,ii))*V(:,ii)';
end
