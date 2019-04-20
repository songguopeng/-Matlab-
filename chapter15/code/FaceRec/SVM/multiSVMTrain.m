function multiSVMStruct = multiSVMTrain(TrainData, nSampPerClass, nClass, C, gamma)
%function multiSVMStruct = multiSVMTrain(TrainData, nSampPerClass, nClass, C, gamma)
% ����1��1ͶƱ���Խ� SVM �ƹ������������ѵ�����̣�������SVMѵ�����������multiSVMStruct��
%
% ����:--TrainData:ÿ����һ����������
%     --nClass:�������������
%     --nSampPerClass:nClass*1ά����������¼ÿ���������Ŀ���� nSampPerClass(iClass)
%     �����˵�iClass���������Ŀ
%     --C:�������ϵ����Ĭ��Ϊ Inf
%     --gamma:������˺����Ĳ��� gamma��Ĭ��ֵΪ1
%
% ���:--multiSVMStruct:һ����������SVMѵ������Ľṹ��

% Ĭ�ϲ���
if nargin < 4
    C = Inf;
    gamma = 1;
elseif nargin < 5
    gamma = 1;
end



%��ʼѵ������Ҫ����ÿ�����ķ��೬ƽ�棬��(nClass-1)*nClass/2��
for ii=1:(nClass-1)
    for jj=(ii+1):nClass
        clear X;
        clear Y;
        startPosII = sum( nSampPerClass(1:ii-1) ) + 1;
        endPosII = startPosII + nSampPerClass(ii) - 1;
        X(1:nSampPerClass(ii), :) = TrainData(startPosII:endPosII, :);
            
        startPosJJ = sum( nSampPerClass(1:jj-1) ) + 1;
        endPosJJ = startPosJJ + nSampPerClass(jj) - 1;
        X(nSampPerClass(ii)+1:nSampPerClass(ii)+nSampPerClass(jj), :) = TrainData(startPosJJ:endPosJJ, :);
        
        
        % �趨��������ʱ�����ǩ
        Y = ones(nSampPerClass(ii) + nSampPerClass(jj), 1);
        Y(nSampPerClass(ii)+1:nSampPerClass(ii)+nSampPerClass(jj)) = 0;
        
        % ��ii���˺͵�jj������������ʱ�ķ������ṹ��Ϣ
        CASVMStruct{ii}{jj}= svmtrain( X, Y, 'Kernel_Function', @(X,Y) kfun_rbf(X,Y,gamma), 'boxconstraint', C );
     end
end

% ��ѧ�õķ�����
multiSVMStruct.nClass = nClass;
multiSVMStruct.CASVMStruct = CASVMStruct;

% �������
save('Mat/params.mat', 'C', 'gamma');



