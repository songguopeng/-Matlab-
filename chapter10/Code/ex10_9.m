f = [0 1 2 3 4 5 4 3 2 1 0];
figure, h_f = plot(f);
seFlat = strel([1 1 1]) % ����ƽ̹(�߶�Ϊ0)�ĽṹԪ�� 
fe1 = imerode(f, seFlat); %ʹ��ƽ̹�ṹԪ�صĻҶȸ�ʴ
hold on, h_fe1 = plot(fe1, '-ro');
axis([1 11 0 8])
 
seHeight = strel([1 1 1], [1 1 1]) % ע��˴�strel���÷�����һ��������Ԫ��Ϊ0��1����ʾ�ṹԪ�ص�����Χ����״�����ڶ���������ʾ�ṹԪ�صĸ߶�
fe2 = imerode(f, seHeight); %ʹ�þ��и߶ȵĽṹԪ�صĻҶȸ�ʴ
hold on, h_fe2 = plot(fe2, '-g*');
legend('ԭ�Ҷ�1ά����f', 'ʹ��ƽ̹�ṹԪ�ظ�ʴ��', 'ʹ�ø߶�Ϊ1�ĽṹԪ�ظ�ʴ��');
