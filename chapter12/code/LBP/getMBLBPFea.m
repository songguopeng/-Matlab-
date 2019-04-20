function [histLBP, MatLBP, MatLBP_MB] = getMBLBPFea(I, blockSize)
% �������ͼ�� I ��LBP����,(8,2),uniform
%
% ���룺I --- ����ͼ��
%       blockSize --- MBLBP �еķֿ��С��Ĭ��ֵΪ1
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



% ʣ�µ�������ǶԷֿ�����ӳ�� I_MB ���� blockSize = 1 �� uniform (8, 2) LBP������
rad = 2;
if (mSub <= 2*rad) || (nSub <= 2*rad)
    error('I is too small to compute LBP feature!');
end

MatLBP_MB = zeros(mSub-2*rad, nSub-2*rad);

% ���� LBP ӳ��(���ػҶ���ֱ��ͼ�ռ���������ӳ��)
load Mat/LBPMap.mat;

for ii = 1+rad : mSub-rad
    for jj = 1+rad : nSub-rad
        nCnt = 1;
        
        
        % ����(8,2)���������ֵ�������������ĵĵ�ͨ��˫���Բ�ֵ�����ֵ
        nbPT(nCnt) = I_MB(ii, jj-rad);
        nCnt = nCnt + 1;
        
        horInterp1 = I_MB(ii-2, jj-2) + 0.5858*( I_MB(ii-2, jj-1) - I_MB(ii-2, jj-2) ); % ˮƽ�����ֵ
        horInterp2 = I_MB(ii-1, jj-2) + 0.5858*( I_MB(ii-1, jj-1) - I_MB(ii-1, jj-2) ); % ˮƽ�����ֵ
        verInterp = horInterp1 + 0.5858*( horInterp2 - horInterp1 ); % ��ֱ�����ֵ
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii-2, jj);
        nCnt = nCnt + 1;
        
        horInterp1 = I_MB(ii-2, jj+1) + 0.4142*( I_MB(ii-2, jj+2) - I_MB(ii-2, jj+1) );
        horInterp2 = I_MB(ii-1, jj+1) + 0.4142*( I_MB(ii-1, jj+2) - I_MB(ii-1, jj+1) );
        verInterp = horInterp1 + 0.5858*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii, jj+2);
        nCnt = nCnt + 1;
        
        horInterp1 = I_MB(ii+1, jj+1) + 0.4142*( I_MB(ii+1, jj+2) - I_MB(ii+1, jj+1) );
        horInterp2 = I_MB(ii+2, jj+1) + 0.4142*( I_MB(ii+2, jj+2) - I_MB(ii+2, jj+1) );
        verInterp = horInterp1 + 0.4142*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii+2, jj);
        nCnt = nCnt + 1;
        
        horInterp1 = I_MB(ii+1, jj-2) + 0.5858*( I_MB(ii+1, jj-1) - I_MB(ii+1, jj-2) );
        horInterp2 = I_MB(ii+2, jj-2) + 0.5858*( I_MB(ii+2, jj-1) - I_MB(ii+2, jj-1) );
        verInterp = horInterp1 + 0.4142*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
                
        
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
