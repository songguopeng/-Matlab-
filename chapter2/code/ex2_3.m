A = rand(3000, 3000);
f = zeros(3000, 3000);
u0 = 100; v0 = 100;

tic;	% ��ʼ��ʱ

% һά����
% ���forѭ����ʼ
for r=1:3000
	u0x=u0*(r-1);
	% �ڲ�forѭ����ʼ
	for c=1:3000
		v0y=v0*(c-1);
		f(r,c) = A(r,c) * cos(u0x+v0y);
	% �ڲ�forѭ������
	end
% ���forѭ������
end
t1=toc	% ֹͣ��ʱ����¼ʱ�䵽t1

tic;	% ���¿�ʼ��ʱ
% ��ά����
r = 0:3000-1;
c = 0:3000-1;
[C, R] = meshgrid(c, r);
% meshgrid��������������ĺ�����ʵ�ʾ���������Ҫ�Ķ�ά���ص��������ϱ�ʾ
% ��������������жϣ��۲�һ��C��R��������ݡ�

g = A .* cos(u0 .* R + v0 .* C);
%ϵͳ���Զ�ִ�С�ѭ����������ʵ���Ƕ�R��C��ÿ�����ݰ���ָ����ʽ����

t2 = toc	% ֹͣ��ʱ������ʱֵ���浽t2