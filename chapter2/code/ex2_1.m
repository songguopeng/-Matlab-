arg=input('Input argument:');		% ��ʾ����arg����
total = 0; detail = 0;
% if��俪ʼ
if(arg==1)
	% ���for��俪ʼ
	for i=1:1:5
		total = total + 1;
		% �ڲ�for��俪ʼ
		for j=1:0.1:2
			detail = detail + total;
		% �ڲ�for������
		end
	% ���for������
	end
% if������һ��֧
elseif (arg==2)
	total = 0;
	detail = total;
% if�����������з�֧
else
	error('Invalid arguments!');
% if������
end
detail		% ��ʾdetai