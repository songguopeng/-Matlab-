load fisheriris %载入Matlab自带的鸢尾属植物数据集
data = [meas(:,1), meas(:,2)]; %采用花瓣长度和花瓣宽度作为特征
figure
scatter(data(1:50, 1), data(1:50, 2), 'b+') % 第一类
hold on,scatter(data(51:100, 1), data(51:100, 2), 'r*') % 第二类
hold on,scatter(data(101:150, 1), data(101:150, 2), 'go') % 第三类
data = [meas(:,1), meas(:,3)]; %采用花瓣长度和萼片长度作为特征
figure
scatter(data(1:50, 1), data(1:50, 2), 'b+') % 第一类
hold on,scatter(data(51:100, 1), data(51:100, 2), 'r*') % 第二类
hold on,scatter(data(101:150, 1), data(101:150, 2), 'go') % 第三类
