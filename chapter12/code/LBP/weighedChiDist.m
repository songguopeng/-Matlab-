function dist = weighedChiDist(LBPFea1, LBPFea2, weight)
% �������� LBP ����(���зֿ�)�ļ�Ȩ��������

nLBPFea = 59;
nLen = length(LBPFea1);

nBlock = nLen / nLBPFea;

dist = 0;

if nargin < 3
    weight = ones(1, nBlock);
end

for iBlock = 1:nBlock
    % �����Ӧ��ķֿ� LBP ֱ��ͼ����
    dist = dist + weight(iBlock) * dist_LBPHist( LBPFea1( (iBlock-1)*nLBPFea+1:iBlock*nLBPFea ), LBPFea2( (iBlock-1)*nLBPFea+1:iBlock*nLBPFea ) );
end