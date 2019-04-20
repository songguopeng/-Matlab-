intensity = imread('circuit.tif');

bw1 = edge(intensity, 'sobel');
bw2 = edge(intensity, 'prewitt');
bw3 = edge(intensity, 'roberts');
bw4 = edge(intensity, 'log');
bw5 = edge(intensity, 'canny');

subplot(3,2,1); imshow(intensity); title('a'); % ͼ11.6(a)
subplot(3,2,2); imshow(bw1); title('b'); % ͼ11.6(b)
subplot(3,2,3); imshow(bw2); title('c'); % ͼ11.6(c)
subplot(3,2,4); imshow(bw3); title('d'); % ͼ11.6(d)
subplot(3,2,5); imshow(bw4); title('e'); % ͼ11.6(e)
subplot(3,2,6); imshow(bw5); title('f'); % ͼ11.6(f)
