I = imread('../starcraft.bmp'); %读入图像
figure, imshow(I); %得到图10.10(a)
Ie1 = imerode(I, [1 1 1; 1 1 1; 1 1 1]) ; %3*3正方形结构元素的腐蚀
figure, imshow(Ie1);  %得到图10.10(b)
Ie2 = imerode(Ie1, [0 1 0; 1 1 1; 0 1 0]);  %3*3十字形结构元素的腐蚀
figure, imshow(Ie2);  %得到图10.10(c)
Id1 = imdilate(Ie2, [1 1 1; 1 1 1; 1 1 1]);  %3*3正方形结构元素的膨胀
figure, imshow(Id1);  %得到图10.10(d)
Id2 = imdilate(Id1, [1 1 1; 1 1 1; 1 1 1]);  %3*3正方形结构元素的膨胀
figure, imshow(Id2);  %得到图10.10(e)
Id3 = imdilate(Id2, [0 1 0; 1 1 1; 0 1 0]);
figure, imshow(Id3); %得到图10.10(f) %3*3十字形结构元素的膨胀
