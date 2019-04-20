I  = imread('circuit.tif'); % 读取图像

% 旋转图像并寻找边缘
rotI = imrotate(I,33,'crop');
BW = edge(rotI,'canny');

% 执行Hough变换并显示Hough矩阵
[H,T,R] = hough(BW);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit'); %得到图9.12（a）
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

% 在Hough矩阵中寻找前5个大于Hough矩阵中最大值0.3倍的峰值
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1)); % 由行、列索引转换成实际坐标
plot(x,y,'s','color','white'); % 在Hough矩阵图像中标出峰值位置

% 找到并绘制直线
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7); % 合并距离小于5的线段，丢弃所有长度小于7的直线段
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines) % 依次标出各条直线段
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % 绘制线段端点
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % 确定最长的线段
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% 高亮显示最长线段
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan'); %得到图9.12（b）


