function out = imgrayscaling(varargin)
% IMGRAYSCALING     ִ�лҶ����칦��
%   �﷨��
%       out = imgrayscaling(I, [x1,x2], [y1,y2]);
%       out = imgrayscaling(X, map, [x1,x2], [y1,y2]);
%       out = imgrayscaling(RGB, [x1,x2], [y1,y2]);
%   ��������ṩ�Ҷ����칦�ܣ�����ͼ��Ӧ���ǻҶ�ͼ�񣬵�����ṩ�Ĳ��ǻҶ�
%   ͼ��Ļ����������Զ���ͼ��ת��Ϊ�Ҷ���ʽ��x1��x2��y1��y2Ӧ��ʹ��˫����
%   ���ʹ洢��ͼ��������ʹ���κ�MATLAB֧�ֵ����ʹ洢��

[A, map, x1 , x2, y1, y2] = parse_inputs(varargin{:});

% ��������ͼ��A���������Ͷ�Ӧ��ȡֵ��Χ
range = getrangefromclass(A);
range = range(2);

% �������ͼ���ǻҶ�ͼ������Ҫִ��ת��
if ndims(A)==3,% A����Ϊ3ά��RGBͼ��
  A = rgb2gray(A);
elseif ~isempty(map),% MAP����Ϊ�ǿգ�����ͼ��
  A = ind2gray(A,map);
end % �ԻҶ�ͼ������Ҫת��
 
% ��ȡԭʼͼ��Ĵ�С����ʼ�����ͼ��
[M,N] = size(A);
I = im2double(A);		% ������ͼ��ת��Ϊ˫��������
out = zeros(M,N);
 
% ���岿�֣�˫��Ƕ��ѭ����ѡ��ṹ
for i=1:M
    for j=1:N
        if I(i,j)<x1
            out(i,j) = y1 * I(i,j) / x1;
        elseif I(i,j)>x2
            out(i,j) = (I(i,j)-x2)*(range-y2)/(range-x2) + y2;
        else
            out(i,j) = (I(i,j)-x1)*(y2-y1)/(x2-x1) + y1;
        end
    end
end

% �����ͼ��ĸ�ʽת��Ϊ������ͼ����ͬ
if isa(A, 'uint8') % uint8
    out = im2uint8(out);
elseif isa(A, 'uint16')
    out = im2uint16(out);
% ������������˫�������͵�ͼ��
end

 % ���:
if nargout==0 % ���û���ṩ�������ܷ���ֵ
  imshow(out);
  return;
end
%-----------------------------------------------------------------------------
function [A, map, x1, x2, y1, y2] = parse_inputs(varargin);
% ����������������������������Ч�Եĺ���parse_inputs
% A       ����ͼ��RGBͼ (3D), �Ҷ�ͼ (2D), ��������ͼ (X)
% map     ����ͼ��ɫ�� (:,3)
% [x1,x2] ������ 1������������ת�۵�ĺ�����
% [y1,y2] ������ 2������������ת�۵��������
% ���Ƚ���һ���յ�map����������������isempty(map)ʱ����
map = [];
 
%   IPTCHECKNARGIN(LOW,HIGH,NUM_INPUTS,FUNC_NAME) �����������ĸ����Ƿ�
%   ����Ҫ�󣬼�NUM_INPUTS�а�����������������Ƿ���LOW��HIGH��ָ���ķ�Χ
%   �ڡ�������ڷ�Χ�ڣ���˺�������һ����ʽ���Ĵ�����Ϣ��
iptchecknargin(3,4,nargin,mfilename);
 
%   IPTCHECKINPUT(A,CLASSES,ATTRIBUTES,FUNC_NAME,VAR_NAME, ARG_POS) ������
%   ����A�е�Ԫ���Ƿ����ڸ����������б��������Ԫ�ز����ڸ��������ͣ������
%   һ����ʽ���Ĵ�����Ϣ��
iptcheckinput(varargin{1},...
              {'uint8','uint16','int16','double'}, ...
              {'real', 'nonsparse'},mfilename,'I, X or RGB',1);
 
switch nargin
 case 3 %            ������imgrayscaling(I, [x1,x2], [y1,y2]) �� imgrayscaling(RGB, [x1,x2], [y1,y2])
  A = varargin{1};
  x1 = varargin{2}(1);
  x2 = varargin{2}(2);
  y1 = varargin{3}(1);
  y2 = varargin{3}(2);
 case 4
  A = varargin{1};%               imgrayscaling(X, map, [x1,x2], [y1,y2])
  map = varargin{2};
  x1 = varargin{2}(1);
  x2 = varargin{2}(2);
  y1 = varargin{3}(1);
  y2 = varargin{3}(2);
end

% ��������������Ч��
% ���RGB����
if (ndims(A)==3) && (size(A,3)~=3)   
    msg = sprintf('%s: ���ɫͼ��Ӧ��ʹ��һ��M-N-3ά�ȵ�����', ...
                  upper(mfilename));
    eid = sprintf('Images:%s:trueColorRgbImageMustBeMbyNby3',mfilename);
    error(eid,'%s',msg);
end
 
if ~isempty(map) 
% ����ɫ��
  if (size(map,2) ~= 3) || ndims(map)>2
    msg1 = sprintf('%s: ����ĵ�ɫ��Ӧ����һ������', ...
                   upper(mfilename));
    msg2 = '��ӵ������';
    eid = sprintf('Images:%s:inColormapMustBe2Dwith3Cols',mfilename);
    error(eid,'%s %s',msg1,msg2);
    
  elseif (min(map(:))<0) || (max(map(:))>1)
    msg1 = sprintf('%s: ��ɫ���и���������ǿ�� ',upper(mfilename));
    msg2 = 'Ӧ����0��1֮��';
    eid = sprintf('Images:%s:colormapValsMustBe0to1',mfilename);
    error(eid,'%s %s',msg1,msg2);
  end
end
 
% ��int16���͵ľ���ת����uint16����
if isa(A,'int16')
  A = int16touint16(A);
end
