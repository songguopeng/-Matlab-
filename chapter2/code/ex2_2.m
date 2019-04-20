arg=input('Input argument:');
total = 0; detail = 0;
% switch语句开始
switch arg
	% 分支1
	case 1
		i=1;
		% 外层while语句开始
		while (i<=5)
			total = total + 1;
			i = i + 1;
			j = 1;
			% 内层while语句开始
			while (j<=2);
				detail = detail + total;
				j = j + 0.1;
			% 内层while语句结束
			end
		% 外层while语句结束
		end
	% 分支2
	case 2
		total = 0;
		detail = total;
	% 分支其他
	case others
		error('Invalid arguments');
% switch语句结束
end
detail
