arg=input('Input argument:');
total = 0; detail = 0;
% switch��俪ʼ
switch arg
	% ��֧1
	case 1
		i=1;
		% ���while��俪ʼ
		while (i<=5)
			total = total + 1;
			i = i + 1;
			j = 1;
			% �ڲ�while��俪ʼ
			while (j<=2);
				detail = detail + total;
				j = j + 0.1;
			% �ڲ�while������
			end
		% ���while������
		end
	% ��֧2
	case 2
		total = 0;
		detail = total;
	% ��֧����
	case others
		error('Invalid arguments');
% switch������
end
detail
