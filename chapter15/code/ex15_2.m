load fisheriris % ����fisheriris���ݼ� 
data = [meas(:,1), meas(:,2)]; % ȡ������������ǰ2ά��Ϊ����

% ת��Ϊ���ǲ���setosa�ࡱ��2������
groups = ismember(species,'setosa');

% ���ý�����֤����ָ����ݼ�
[train, test] = crossvalind('holdOut',groups);

% ѵ��һ�����Ե�֧����������ѵ���õķ�����������svmStruct
svmStruct = svmtrain(data(train,:),groups(train),'showplot',true);


% ���ð���ѵ�����÷�������Ϣ��svmStruct�Բ����������з��࣬���������浽classes
classes = svmclassify(svmStruct,data(test,:),'showplot',true);

% �������������ʶ����
nCorrect = sum( classes == groups(test,:) ); % ��ȷ�����������Ŀ
accuracy = nCorrect / length(classes) % ������ȷ��

