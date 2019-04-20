load fisheriris % 载入fisheriris数据集 
data = [meas(:,1), meas(:,2)]; % 取出所有样本的前2维作为特征

% 转化为“是不是setosa类”的2类问题
groups = ismember(species,'setosa');

% 利用交叉验证随机分割数据集
[train, test] = crossvalind('holdOut',groups);

% 训练一个线性的支持向量机，训练好的分类器保存在svmStruct
svmStruct = svmtrain(data(train,:),groups(train),'showplot',true);


% 利用包含训练所得分类器信息的svmStruct对测试样本进行分类，分类结果保存到classes
classes = svmclassify(svmStruct,data(test,:),'showplot',true);

% 计算测试样本的识别率
nCorrect = sum( classes == groups(test,:) ); % 正确分类的样本数目
accuracy = nCorrect / length(classes) % 计算正确率

