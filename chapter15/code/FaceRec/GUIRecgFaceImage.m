% GUIRecgFaceImage.m

nClass = classify(filepath);
msgbox( ['�������Ϊ:',num2str(nClass)] );
axes(h_axes2);
f = imread(['Data/ORL/S',num2str(nClass),'/1.pgm']); % �򿪸��˵ĵ�1��ͼ��
imshow(f);