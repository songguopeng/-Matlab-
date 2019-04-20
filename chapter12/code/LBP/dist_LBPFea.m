function distVec = dist_LBPFea(LBPFea1, LBPFea2)
% compute the difference vector between 2 LBP features

nLBPFea = 59;
nLen = length(LBPFea1);

nBlock = nLen / nLBPFea;

distVec = zeros(1, nBlock);

for iBlock = 1:nBlock
    % �����Ӧ��ķֿ� LBP ֱ��ͼ����
    distVec(iBlock) = dist_LBPHist( LBPFea1( (iBlock-1)*nLBPFea+1:iBlock*nLBPFea ), LBPFea2( (iBlock-1)*nLBPFea+1:iBlock*nLBPFea ) );
end
