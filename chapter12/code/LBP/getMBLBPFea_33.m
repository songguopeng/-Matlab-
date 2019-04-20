function [histLBP, MatLBP, MatLBP_MB] = getMBLBPFea_33(I, blockSize)
% �������ͼ�� I ��LBP����,3*3,uniform
% return value: MatLBP --- LBP ��Ӧ����
%               histLBP --- 1ά��������LBP ֱ��ͼ
%               blockSize --- MBLBP �еķֿ��С��Ĭ��ֵΪ1
%
% ���룺I --- ����ͼ��
%       blockSize --- ��Ĵ�С
%
% ����ֵ: MatLBP --- LBP ��Ӧ����
%        histLBP --- 1ά��������LBP ֱ��ͼ
%        MatLBP_MB --- MBLBP �����ؿ�ͷֱ��ʱ�ʾ

if nargin < 2
    blockSize = 1;
end

% ��÷ֿ�ͼ��I�Ĵ�С
[m n] = size(I);


% ��ԭʼͼ������ blockSize �ֿ飬����ÿ���ƽ���Ҷ�ֵ����Ӧ������ӳ����� I_MB ��
mSub = floor(m / blockSize);
nSub = floor(n / blockSize);

mRem = mod(m, blockSize);
nRem = mod(n, blockSize);
mRem = round(mRem / 2);
nRem = round(nRem / 2);

I_MB = zeros(mSub, nSub);

for ii = 1:mSub
    for jj = 1:nSub
        I_center = I( 1+mRem:mRem+mSub*blockSize, 1+nRem:nRem+nSub*blockSize ); % ȡ�������򣬲����ֳ����������������
        SubRgn = I_center( (ii-1)*blockSize+1 : ii*blockSize, (jj-1)*blockSize+1 : jj*blockSize );
        I_MB(ii, jj) = mean( SubRgn(:) );
    end
end



% ʣ�µ�������ǶԷֿ�����ӳ�� I_MB ���� blockSize = 1 �� uniform 3*3 LBP������
rad = 1;
if (mSub <= 2*rad) || (nSub <= 2*rad)
    error('I is too small to compute LBP feature!');
end

MatLBP_MB = zeros(mSub-2*rad, nSub-2*rad);

% ���� LBP ӳ��(���ػҶ���ֱ��ͼ�ռ���������ӳ��)
load Mat/LBPMap.mat;

for ii = 1+rad : mSub-rad
    for jj = 1+rad : nSub-rad
        nCnt = 1;
        
        
        % ���� 3*3 ���������ֵ
        nbPT(nCnt) = I_MB(ii-rad, jj-rad);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii-rad, jj);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii-rad, jj+rad);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii, jj+rad);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii+rad, jj+rad);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii+rad, jj);
        nCnt = nCnt + 1;

        nbPT(nCnt) = I_MB(ii+rad, jj-rad);
        nCnt = nCnt + 1;

        nbPT(nCnt) = I_MB(ii, jj-rad);

                
        
        for iCnt = 1:nCnt
            if( nbPT(iCnt) >= I_MB(ii, jj) )
                MatLBP_MB(ii-rad, jj-rad) = MatLBP_MB(ii-rad, jj-rad) + 2^(nCnt-iCnt);
            end
        end
    end
end

% ��ԭ MatLBP_MB
MatLBP = zeros(m-2*rad*blockSize, n-2*rad*blockSize);
for ii = 1:mSub-2*rad
    for jj = 1:nSub-2*rad
        MatLBP( mRem+(ii-1)*blockSize+1 : mRem+ii*blockSize, nRem+(jj-1)*blockSize+1 : nRem+jj*blockSize ) = MatLBP_MB(ii, jj);
    end
end


% ����LBPֱ��ͼ
histLBP = zeros(1, 59); % ����(8,2)��uniformֱ��ͼ����59���ռ���

for ii = 1:mSub-2*rad
    for jj = 1:nSub-2*rad
        histLBP( vecLBPMap( MatLBP_MB(ii, jj)+1 ) ) = histLBP( vecLBPMap( MatLBP_MB(ii, jj)+1 ) ) + 1;
    end
end
















