% ps1
clear;clc;
%% 1-a
img = imread(fullfile('input', 'ps1-input0.png'));  % already grayscale
%img = imread('3.jpg');  % already grayscale
%img = img(:, :, 1);
img_edges = edge(img, 'canny', []);
figure();
ax1 = subplot(2,1,1);
imshow(img)
ax2 = subplot(2,1,2);
imshow(img_edges)
%% TODO: Compute edge image img_edges
imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges, 'RhoResolution', 1);  % defined in hough_lines_acc.m
figure();
imagesc(H, 'XData', theta, 'YData', rho);
title('Hough accumulator');
%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png

%% 2-b
peaks = hough_peaks(H, 10);  % defined in hough_peaks.m
hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)),'rs');
hold off;
%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png

%% TODO: Rest of your code here
hough_lines_draw(img, 'ps1-2-c-1.png', peaks, rho, theta);
%%
clear;clc;
%% 1-a
img = imread(fullfile('input', 'ps1-input0-noise.png'));  % already grayscale
%img = imread('3.jpg');  % already grayscale
%img = img(:, :, 1);


figure();
ax1 = subplot(4,1,1);
imshow(img)

hsize = 11;
sigma = 4;
filter = fspecial('gaussian', hsize, sigma);
outim = imfilter(img, filter);
ax2 = subplot(4,1,2);
imshow(outim)

img_edges = edge(outim, 'canny', []);
ax4 = subplot(4,1,4);
imshow(img_edges)

img_edges2 = edge(img, 'canny', []);
ax3 = subplot(4,1,3);
imshow(img_edges2)

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges, 'RhoResolution', 1);  % defined in hough_lines_acc.m
figure();
imagesc(H, 'XData', theta, 'YData', rho);
title('Hough accumulator');

%%
peaks = hough_peaks(H, 10, 'Threshold', 0.4*max(H(:)), 'NHoodSize', [21 21]);  % defined in hough_peaks.m
hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)),'rs');
hold off;

%%
hough_lines_draw(outim, 'ps1-2-c-1.png', peaks, rho, theta);

%%
clear;clc;
%% 1-a
img = imread(fullfile('input', 'ps1-input1.png'));  % already grayscale
%img = imread('3.jpg');  % already grayscale
img = img(:, :, 1);

figure();
ax1 = subplot(3,1,1);
imshow(img)

hsize = 11;
sigma = 6;
filter = fspecial('gaussian', hsize, sigma);
outim = imfilter(img, filter);
ax2 = subplot(3,1,2);
imshow(outim)

img_edges = edge(outim, 'canny', []);
ax3 = subplot(3,1,3);
imshow(img_edges)

%% TODO: Compute edge image img_edges
imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges, 'RhoResolution', 1);  % defined in hough_lines_acc.m
figure();
imagesc(H, 'XData', theta, 'YData', rho);
title('Hough accumulator');
%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png

%% 2-b
peaks = hough_peaks(H, 10, 'Threshold', 0.15*max(H(:)), 'NHoodSize', [31 31]);  % defined in hough_peaks.m
hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)),'rs');
hold off;
%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png

%% TODO: Rest of your code here
hough_lines_draw(img, 'ps1-2-c-1.png', peaks, rho, theta);
%%
clear;clc;
%% 1-a
img = imread(fullfile('input', 'ps1-input1.png'));  % already grayscale
%img = imread('3.jpg');  % already grayscale
img = img(:, :, 1);

figure();
ax1 = subplot(3,1,1);
imshow(img)

hsize = 11;
sigma = 6;
filter = fspecial('gaussian', hsize, sigma);
outim = imfilter(img, filter);
ax2 = subplot(3,1,2);
imshow(outim)

img_edges = edge(outim, 'canny', []);
ax3 = subplot(3,1,3);
imshow(img_edges)

%%
H = hough_circles_acc(img_edges, 25);
peaks = hough_peaks(H, 10, 'NHoodSize', [21 21], 'Threshold', 0.5*max(H(:)));
figure();
imagesc(H)
hold on
plot(peaks(:,2),peaks(:,1),'rs')

%%
figure();
imshow(img)
circle(peaks(:, 2), peaks(:, 1), 25);

%%
clear;clc;
%% 1-a
img = imread(fullfile('input', 'ps1-input2.png'));  % already grayscale
%img = imread('3.jpg');  % already grayscale
img = img(:, :, 1);

figure();
ax1 = subplot(3,1,1);
imshow(img)

hsize = 11;
sigma = 20;
filter = fspecial('gaussian', hsize, sigma);
outim = imfilter(img, filter);
ax2 = subplot(3,1,2);
imshow(outim)

img_edges = edge(outim, 'canny', []);
ax3 = subplot(3,1,3);
imshow(img_edges)

%%
peaks = find_circles(img_edges, [15 35]);

%%
figure();
imshow(img)
draw_circle(peaks(:,2), peaks(:,1), peaks(:,4));

%%
clear;clc;
%% 1-a
img = imread(fullfile('input', 'ps1-input2.png'));  % already grayscale
%img = imread('3.jpg');  % already grayscale
img = img(:, :, 1);

figure();
ax1 = subplot(3,1,1);
imshow(img)

hsize = 11;
sigma = 3;
filter = fspecial('gaussian', hsize, sigma);
outim = imfilter(img, filter);
img_edges2 = edge(img, 'canny', []);
ax2 = subplot(3,1,2);
imshow(img_edges2)

img_edges = edge(outim, 'canny', []);
ax3 = subplot(3,1,3);
imshow(img_edges)

[Gx, Gy] = imgradientxy(outim);
[Gmag, Gdir] = imgradient(Gx, Gy);
imshow(Gmag>30)
%%
[H, theta, rho] = hough_lines_acc(img_edges2, 'RhoResolution', 1);  % defined in hough_lines_acc.m
figure();
imagesc(H, 'XData', theta, 'YData', rho);
title('Hough accumulator');

%%
peaks = hough_peaks(H, 20, 'Threshold', 0.3*max(H(:))...
    , 'NHoodSize', [31 31]);  % defined in hough_peaks.m
hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)),'rs');
hold off;

%%
hough_lines_draw(img, 'ps1-2-c-1.png', peaks, rho, theta);



