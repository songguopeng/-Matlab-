function [Ibw, thres] = autoThreshold(I)
% �������Զ���ֵ�ָ�
%
% ���룺I - Ҫ�����Զ���ֵ�ָ�ĻҶ�ͼ��
% �����Ibw - �ָ��Ķ�ֵͼ��
%      thres - �Զ��ָ���õ���ֵ

thres = 0.5 * (double(min(I(:))) + double(max(I(:)))); %��ʼ��ֵ
done = false; %������־
while ~done
	g = I >= thres;
	Tnext = 0.5 * (mean(I(g)) + mean(I(~g)));
	done = abs(thres - Tnext) < 0.5;
	thres = Tnext;
end;

Ibw = im2bw(I, thres/255); % ��ֵ��