load fisheriris %����Matlab�Դ����β��ֲ�����ݼ�
data = [meas(:,1), meas(:,2)]; %���û��곤�Ⱥͻ�������Ϊ����
figure
scatter(data(1:50, 1), data(1:50, 2), 'b+') % ��һ��
hold on,scatter(data(51:100, 1), data(51:100, 2), 'r*') % �ڶ���
hold on,scatter(data(101:150, 1), data(101:150, 2), 'go') % ������
data = [meas(:,1), meas(:,3)]; %���û��곤�Ⱥ���Ƭ������Ϊ����
figure
scatter(data(1:50, 1), data(1:50, 2), 'b+') % ��һ��
hold on,scatter(data(51:100, 1), data(51:100, 2), 'r*') % �ڶ���
hold on,scatter(data(101:150, 1), data(101:150, 2), 'go') % ������
