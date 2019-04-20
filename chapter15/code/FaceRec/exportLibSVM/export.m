function export(strMat, strLibSVM)
% ���Բ��� strMat ָ�����ļ��е����ݵ���Ϊ�ܹ��� LibSVM ʹ�õĸ�ʽ�����ɵ��ļ����ɲ��� strLibSVM ָ��
%
% ���룺strMat --- Դ�ļ���������·������'.mat'�ļ���Ĭ��Ϊ'../Mat/trainData.mat'�����б������ѵ������
%                  TrainData �����ǩ trainLabel�����ļ�����ѵ�� SVM ����������
%       strLibSVM --- Ŀ���ļ���������·������'.txt'�ļ���Ĭ��Ϊ'trainData.txt'

if nargin < 1
    strMat = '../Mat/trainData.mat';
    strLibSVM = 'trainData.txt';
elseif nargin < 2
    strLibSVM = 'trainData.txt';
end

[fid, fMsg ] = fopen(strLibSVM, 'w'); % ����Ŀ������ļ�
if fid == -1
    disp(fMsg );
    return
end

strNewLine = [13 10]; % ����
strBlank = ' ';
    
load(strMat)

[nSamp, nDim] = size( TrainData );


for iSamp = 1:nSamp
    fwrite(fid, num2str(trainLabel(iSamp)), 'char');
    
    for iDim = 1:nDim
        fwrite(fid, strBlank, 'char');
        fwrite(fid, [num2str(iDim) ':'], 'char');
        fwrite(fid, num2str(TrainData(iSamp, iDim)), 'char');        
    end
    
    fwrite(fid, strNewLine, 'char');
end



fclose(fid);

