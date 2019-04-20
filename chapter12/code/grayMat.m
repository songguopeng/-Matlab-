function grayMat = grayMat( I, nLevel, x1, y1, x2, y2 )
% ����ͼ��I�ĻҶȹ��־���
% I - ����ͼ��
% nLevel - Ҫͳ�ƵĻҶȼ���Ŀ
% x1, y1, x2, y2 - Ҫͳ�ƵĿռ�λ�ù�ϵ
%
% grayMat - �Ҷȹ��־��󣬴�СΪnLevel*nLevel

if nargin < 3
    x1 = 1;% Ĭ����+45�ȵ�λ�ù�ϵ
    y1 = -1;
    x2 = -1;
    y2 = 1;
end




% �� I ���лҶȼ�����
minVal = min(I(:));
maxVal = max(I(:));
[m n] = size(I);




if (maxVal - minVal + 1) >= nLevel

span = double(maxVal-minVal) / nLevel;

ruler = double(minVal):span:double(maxVal);

ind = find(I < ruler(2));
I2 = I; % I2Ϊ���лҶȼ�ѹ�����ͼ�񣬻Ҷȼ��±��1��ʼ
I2(ind) = 1;
clear ind;

for iLevel = 2:nLevel-1
    for ii = 1:m
        for jj = 1:n
            if (  (I(ii, jj) >= ruler(iLevel)) && (I(ii, jj) < ruler(iLevel+1))  )
                I2(ii, jj) = iLevel;
            end
        end
    end
end


ind = find(I >= ruler(nLevel));
I2(ind) = nLevel;
clear ind;

else
    error('hello');
end

grayMat = zeros(nLevel, nLevel);


% ����Ҷȹ��־���
for ii = 1:m
    for jj = 1:n
        ii2 = ii+y1;
        jj2 = jj+x1;
        if( (ii2 >= 1) && (ii2<=m) &&(jj2>=1) &&(jj2<=n) )
            grayMat(I2(ii, jj), I2(ii2, jj2)) = grayMat(I2(ii, jj), I2(ii2, jj2)) + 1;
        end
        
        ii2 = ii+y2;
        jj2 = jj+x2;
        if( (ii2 >= 1) && (ii2<=m) &&(jj2>=1) &&(jj2<=n) )
            grayMat(I2(ii, jj), I2(ii2, jj2)) = grayMat(I2(ii, jj), I2(ii2, jj2)) + 1;
        end
    end
end

