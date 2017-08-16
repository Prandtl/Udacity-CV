% ps1
pkg load image;  % Octave only

%% 1-a
img = imread(fullfile('input', 'ps1-input0.png'));  % already grayscale
%% TODO: Compute edge image img_edges

img_edges = edge(img, 'canny');

imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-a
[H, theta, rho] = hough_lines_acc(img_edges, 'RhoResolution', 0.5, 'Theta', -90:89);  % defined in hough_lines_acc.m
%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png
gray = mat2gray(H);
adjustedHough = imadjust(gray);
imwrite(gray, fullfile('output', 'ps1-2-a-1.png'));  % save as output/ps1-2-a-1.png
imwrite(adjustedHough, fullfile('output', 'ps1-2-a-2.png'));  % save as output/ps1-2-a-2.png

%% 2-b
peaks = hough_peaks(H, 10);  % defined in hough_peaks.m
accumRgb = cat(3, gray, gray, gray);
peaksSize = size(peaks);
for ii = 1:peaksSize(1)
    peak = peaks(ii, :);
    row = peak(1);
    col = peak(2);
    accumRgb(row, col, 1) = 255;
    accumRgb(row, col, 2) = 0;
    accumRgb(row, col, 3) = 0;
endfor

imwrite(accumRgb, fullfile('output', 'ps1-2-b-1.png'));  % save as output/ps1-2-a-1.png
%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png
% disp(peaks);
% figure, imagesc(H, 'XData', theta, 'YData', rho), title('Accumulator array');
% hold on;
% plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 'rs');
% hold off;
%% TODO: Rest of your code here
