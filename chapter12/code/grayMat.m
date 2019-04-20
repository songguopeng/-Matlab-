function grayMat = grayMat( I, nLevel, x1, y1, x2, y2 )
% 计算图像I的灰度共现矩阵
% I - 输入图像
% nLevel - 要统计的灰度级数目
% x1, y1, x2, y2 - 要统计的空间位置关系
%
% grayMat - 灰度共现矩阵，大小为nLevel*nLevel

if nargin < 3
    x1 = 1;% 默认是+45度的位置关系
    y1 = -1;
    x2 = -1;
    y2 = 1;
end




% 对 I 进行灰度级划分
minVal = min(I(:));
maxVal = max(I(:));
[m n] = size(I);




if (maxVal - minVal + 1) >= nLevel

span = double(maxVal-minVal) / nLevel;

ruler = double(minVal):span:double(maxVal);

ind = find(I < ruler(2));
I2 = I; % I2为进行灰度级压缩后的图像，灰度级下标从1开始
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


% 计算灰度共现矩阵
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

