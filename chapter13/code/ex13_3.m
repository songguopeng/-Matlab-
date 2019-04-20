load fisheriris %����Matlab�Դ����β��ֲ�����ݼ�

% ÿ���ǰ40�������������ɴ�������ģ�壬��10����Ϊ�����Ĳ�������
m1 = mean( meas(1:40, :) ); %��1���ǰ40��������ƽ������
m2 = mean( meas(51:90, :) ); %��2���ǰ40��������ƽ������
m3 = mean( meas(101:140, :) ); %��3���ǰ40��������ƽ������

% ����������
Test = [meas(41:50, :); meas(91:100, :); meas(141:150, :)];
% ������������Ӧ������ǩ
classLabel(1:10) = 1;
classLabel(11:20) = 2;
classLabel(21:30) = 3;

% ������С��������������������
class = zeros(1, 30); %���ǩ
for ii = 1:size(Test, 1)
   d(1) = norm(Test(ii, :) - m1); %��ڣ���ľ���
   d(2) = norm(Test(ii, :) - m2); %��ڣ���ľ���
   d(3) = norm(Test(ii, :) - m3); %��ڣ���ľ���
   
   [minVal class(ii)] = min(d); %������С���벢������������̵��ำ�����ǩ���� class
end

% ������С�����������ʶ����
nErr = sum(class ~= classLabel);
rate = 1 - nErr / length(class);
strOut = ['ʶ����Ϊ', num2str(rate)]
