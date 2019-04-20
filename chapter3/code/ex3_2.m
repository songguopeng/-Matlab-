I = imread('pout.tif'); %����ԭͼ��

% Gammaȡ0.75
subplot(1,3,1);
imshow(imadjust(I, [ ], [ ], 0.75));
title('Gamma 0.75');

% Gammaȡ1
subplot(1,3,2);
imshow(imadjust(I, [ ], [ ], 1));
title('Gamma 1');

% Gammaȡ1.5
subplot(1,3,3);
imshow(imadjust(I, [ ], [ ], 1.5));
title('Gamma 1.5');

figure;
% Gammaȡ0.75
subplot(1,3,1);
imhist(imadjust(I, [ ], [ ], 0.75));
title('Gamma 0.75');

% Gammaȡ1
subplot(1,3,2);
imhist(imadjust(I, [ ], [ ], 1));
title('Gamma 1');

% Gammaȡ1.5
subplot(1,3,3);
imhist(imadjust(I, [ ], [ ], 1.5));
title('Gamma 1.5');
