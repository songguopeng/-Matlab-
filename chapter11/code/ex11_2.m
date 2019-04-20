I  = imread('circuit.tif'); % ��ȡͼ��

% ��תͼ��Ѱ�ұ�Ե
rotI = imrotate(I,33,'crop');
BW = edge(rotI,'canny');

% ִ��Hough�任����ʾHough����
[H,T,R] = hough(BW);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit'); %�õ�ͼ9.12��a��
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

% ��Hough������Ѱ��ǰ5������Hough���������ֵ0.3���ķ�ֵ
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1)); % ���С�������ת����ʵ������
plot(x,y,'s','color','white'); % ��Hough����ͼ���б����ֵλ��

% �ҵ�������ֱ��
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7); % �ϲ�����С��5���߶Σ��������г���С��7��ֱ�߶�
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines) % ���α������ֱ�߶�
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % �����߶ζ˵�
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % ȷ������߶�
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% ������ʾ��߶�
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan'); %�õ�ͼ9.12��b��


