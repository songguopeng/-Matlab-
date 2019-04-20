I = imread('../lena.bmp');
seHeight = strel(ones(3, 3), ones(3, 3)) % 3*3正方形单位高度的结构元素
Idil = imdilate(I, seHeight);
Iero = imerode(I, seHeight);
subplot(1, 3, 1), imshow(I) %得到图10.36（a）
subplot(1, 3, 2), imshow(Idil) %得到图10.36（b）
subplot(1, 3, 3), imshow(Iero) %得到图10.36（c）
