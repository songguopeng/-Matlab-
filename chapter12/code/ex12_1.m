I = imread('../bw_mouth.bmp'); %读入二值图像，文件bw_mouth.bmp位于付赠光盘第12章的根目录中
Il = bwlabel(I); %标注连通区，得到标记矩阵Il
D = regionprops(Il, 'area', 'centroid'); %提取面积和质心
D % 查看返回的结构体
D.Area % 4个连通区域的面积
v1 = [D.Area] % 将面积转存为向量
D.Centroid % 4个连通区域的质心
v2 = [D.Centroid] %将质心转存为向量
