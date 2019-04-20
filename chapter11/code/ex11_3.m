I1 = imread('rice.png'); %读入原图像
imshow(I1)

%选取阈值为0.2，对原始图像进行四叉树分解
S = qtdecomp(I1,0.2);
%原始的稀疏矩阵转换为普通矩阵，使用full函数
S2 = full(S);	

figure;	
imshow(S2); 

ct = zeros(6, 1); %记录子块数目的列向量

% 分别获得不同大小块的信息，子块内容保存在三维数组vals1~val6中，子块数目保存在ct向量中
for ii = 1:6
	 [vals{ii},r,c] = qtgetblk(I1,S2,2^(ii-1));
	ct(ii) = size(vals{ii},3);
end
