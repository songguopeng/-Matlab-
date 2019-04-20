function histLBP = getLBPHist(I, r, c, nMB)
% ȡ��I�ķ��� LBP ֱ��ͼ
%
% ���룺r,c --- �˷�������Ŀ��r*c������
%       nMB --- MB-LBP �п�Ĵ�С
%
% ����ֵ��histLBP ---  ���� I �ĸ����ֿ��LBPֱ��ͼ���γɵĴ��� I ��LBP������������

[m n] = size(I);

% ��������Ĵ�С
mPartitionSize = floor(m / r);
nPartitionSize = floor(n / c);

for ii = 1:r-1
    for jj = 1:c-1
        Sub = I( (ii-1)*mPartitionSize+1:ii*mPartitionSize, (jj-1)*nPartitionSize+1:jj*nPartitionSize );
%        hist{ii}{jj} = getMBLBPFea( Sub, nMB );
        hist{ii}{jj} = getMBLBPFea_33( Sub, nMB );
    end
end


% �������һ�к����һ��
clear Sub
for ii = 1:r-1
    Sub = I( (ii-1)*mPartitionSize+1:ii*mPartitionSize, (c-1)*nPartitionSize+1:n );
%    hist{ii}{c} = getMBLBPFea(Sub, nMB);
    hist{ii}{c} = getMBLBPFea_33( Sub, nMB );
end
clear Sub

for jj = 1:c-1
    Sub = I( (r-1)*mPartitionSize+1:m, (jj-1)*nPartitionSize+1:jj*nPartitionSize );
%    hist{r}{jj} = getMBLBPFea(Sub, nMB);
    hist{r}{jj} = getMBLBPFea_33( Sub, nMB );
end
clear Sub

Sub = I((r-1)*mPartitionSize+1:m, (c-1)*nPartitionSize+1:n);
%hist{r}{c} = getMBLBPFea(Sub, nMB);
hist{r}{c} = getMBLBPFea_33( Sub, nMB );


% ���Ӹ����ֿ��LBPֱ��ͼ�γɸ�����������
histLBP = zeros(1, 0);
for ii = 1:r
    for jj = 1:c
        histLBP = [histLBP hist{ii}{jj}];
    end
end

