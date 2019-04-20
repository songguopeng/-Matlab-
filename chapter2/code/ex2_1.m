arg=input('Input argument:');		% 提示输入arg变量
total = 0; detail = 0;
% if语句开始
if(arg==1)
	% 外层for语句开始
	for i=1:1:5
		total = total + 1;
		% 内层for语句开始
		for j=1:0.1:2
			detail = detail + total;
		% 内层for语句结束
		end
	% 外层for语句结束
	end
% if语句的另一分支
elseif (arg==2)
	total = 0;
	detail = total;
% if语句的其他所有分支
else
	error('Invalid arguments!');
% if语句结束
end
detail		% 显示detai