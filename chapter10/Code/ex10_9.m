f = [0 1 2 3 4 5 4 3 2 1 0];
figure, h_f = plot(f);
seFlat = strel([1 1 1]) % 构造平坦(高度为0)的结构元素 
fe1 = imerode(f, seFlat); %使用平坦结构元素的灰度腐蚀
hold on, h_fe1 = plot(fe1, '-ro');
axis([1 11 0 8])
 
seHeight = strel([1 1 1], [1 1 1]) % 注意此处strel的用法，第一个参数的元素为0或1，表示结构元素的区域范围（形状），第二个参数表示结构元素的高度
fe2 = imerode(f, seHeight); %使用具有高度的结构元素的灰度腐蚀
hold on, h_fe2 = plot(fe2, '-g*');
legend('原灰度1维函数f', '使用平坦结构元素腐蚀后', '使用高度为1的结构元素腐蚀后');
