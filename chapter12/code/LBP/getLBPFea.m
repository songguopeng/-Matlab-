function [histLBP, MatLBP] = getLBPFea(I)
% �������ͼ�� I ��LBP����,(8,2),uniform
%
% ���룺I --- ����ͼ��
%
% ����ֵ: MatLBP --- LBP��Ӧ����
%               histLBP --- 1ά��������LBPֱ��ͼ

% ��÷ֿ�ͼ��I�Ĵ�С
[m n] = size(I);
rad = 2;
if (m <= 2*rad) || (n <= 2*rad)
    error('I is too small to compute LBP feature!');
end

MatLBP = zeros(m-2*rad, n-2*rad);

% ���� LBP ӳ��(���ػҶ���ֱ��ͼ�ռ���������ӳ��)
load Mat/LBPMap.mat;

for ii = 1+rad : m-rad
    for jj = 1+rad : n-rad
        nCnt = 1;
        
        
        % ����(8,2)���������ֵ�������������ĵĵ�ͨ��˫���Բ�ֵ�����ֵ
        nbPT(nCnt) = I(ii, jj-rad);
        nCnt = nCnt + 1;
        
        horInterp1 = I(ii-2, jj-2) + 0.5858*( I(ii-2, jj-1) - I(ii-2, jj-2) ); % ˮƽ�����ֵ
        horInterp2 = I(ii-1, jj-2) + 0.5858*( I(ii-1, jj-1) - I(ii-1, jj-2) ); % ˮƽ�����ֵ
        verInterp = horInterp1 + 0.5858*( horInterp2 - horInterp1 ); % ��ֱ�����ֵ
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I(ii-2, jj);
        nCnt = nCnt + 1;
        
        horInterp1 = I(ii-2, jj+1) + 0.4142*( I(ii-2, jj+2) - I(ii-2, jj+1) );
        horInterp2 = I(ii-1, jj+1) + 0.4142*( I(ii-1, jj+2) - I(ii-1, jj+1) );
        verInterp = horInterp1 + 0.5858*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I(ii, jj+2);
        nCnt = nCnt + 1;
        
        horInterp1 = I(ii+1, jj+1) + 0.4142*( I(ii+1, jj+2) - I(ii+1, jj+1) );
        horInterp2 = I(ii+2, jj+1) + 0.4142*( I(ii+2, jj+2) - I(ii+2, jj+1) );
        verInterp = horInterp1 + 0.4142*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I(ii+2, jj);
        nCnt = nCnt + 1;
        
        horInterp1 = I(ii+1, jj-2) + 0.5858*( I(ii+1, jj-1) - I(ii+1, jj-2) );
        horInterp2 = I(ii+2, jj-2) + 0.5858*( I(ii+2, jj-1) - I(ii+2, jj-1) );
        verInterp = horInterp1 + 0.4142*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
                
        
        for iCnt = 1:nCnt
            if( nbPT(iCnt) >= I(ii, jj) )
                MatLBP(ii-rad, jj-rad) = MatLBP(ii-rad, jj-rad) + 2^(nCnt-iCnt);
            end
        end
    end
end



% ����LBPֱ��ͼ
histLBP = zeros(1, 59); % ����(8,2)��uniformֱ��ͼ����59���ռ���

for ii = 1:m-2*rad
    for jj = 1:n-2*rad
        histLBP( vecLBPMap( MatLBP(ii, jj)+1 ) ) = histLBP( vecLBPMap( MatLBP(ii, jj)+1 ) ) + 1;
    end
end
















