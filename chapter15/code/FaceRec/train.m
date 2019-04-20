function train(C, gamma)
% ����ѵ�����̣���������ͼ��PCA��ά�Լ����� SVM ѵ���������׶εĴ������ֱ𱣴����ļ���
%   �� PCA �任���� W ������ Mat/PCA.mat
%   �� scaling �ĸ�ά�ϡ��½���Ϣ������ Mat/scaling.mat
%   �� PCA ��ά���� scaling ������ݱ����� Mat/trainData.mat
%   ������ SVM ��ѵ����Ϣ������ Mat/multiSVMTrain.mat

global imgRow;
global imgCol;

display(' ');
display(' ');
display('ѵ����ʼ...');

nPerson=40;
nFacesPerPerson = 5;
display('������������...');
[imgRow,imgCol,FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson,nPerson);
display('..............................');


nFaces=size(FaceContainer,1);%��������������Ŀ

display('PCA��ά...');
[pcaFaces, W] = fastPCA(FaceContainer, 20); % ���ɷַ���PCA
% pcaFaces��200*20�ľ���, ÿһ�д���һ�����ɷ���(��40�ˣ�ÿ��5��)��ÿ����20��ά����
% W�Ƿ���任����, 10304*20 �ľ���
visualize_pc(W);%��ʾ���ɷ���
display('..............................');

X = pcaFaces;

display('Scaling...');
[X,A0,B0] = scaling(X);
save('Mat/scaling.mat', 'A0', 'B0');

% ���� scaling ���ѵ�������� trainData.mat
TrainData = X;
trainLabel = faceLabel;
save('Mat/trainData.mat', 'TrainData', 'trainLabel');
display('..............................');



for iPerson = 1:nPerson
    nSplPerClass(iPerson) = sum( (trainLabel == iPerson) );
end

multiSVMStruct = multiSVMTrain(TrainData, nSplPerClass, nPerson, C, gamma);
display('���ڱ���ѵ�����...');
save('Mat/multiSVMTrain.mat', 'multiSVMStruct');
display('..............................');
display('ѵ��������');