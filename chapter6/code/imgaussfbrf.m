function out = imgaussfbrf(I, freq, width)
% imidealflpf���� 		����Ƶ���˹�����˲���
% I����				����ĻҶ�ͼ��
% freq����				�������Ƶ��
% width����			������

[M,N] = size(I);
out = ones(M,N);
for i=1:M
    for j=1:N
        out(i,j) = 1-exp(-0.5*((((i-M/2)^2+(j-N/2)^2)-freq^2)/(sqrt(i.^2+j.^2)*width))^2);
    end
end
