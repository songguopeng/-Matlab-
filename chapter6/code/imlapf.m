function out = imlapf(I)
% imlapff����			����Ƶ��������˹�˲���
% I����				����ĻҶ�ͼ��

[M,N] = size(I);
out = ones(M,N);
for i=1:M
    for j=1:N
        out(i,j) = -((i-M/2)^2+(j-N/2)^2);
    end
end
