pkg load image;

%ps0-2
img1 = imread('output/ps0-1-a-1.png');
img1_red = img1(:, :, 1);
img1_green = img1(:, :, 2);
img1_blue = img1(:, :, 2);
img1(:, :, 1) = img1(:, :, 3);
img1(:, :, 3) = img1_red;
imwrite(img1, 'output/ps0-2-a-1.png');
imwrite(img1_green, 'output/ps0-2-b-1.png');
imwrite(img1_red, 'output/ps0-2-c-1.png');

%ps0-3
green_size = size(img1_green);
disp(green_size);
%206-306
square = img1_green(207:306, 207:306);
red_copy = img1_red;
red_copy(207:306, 207:306) = square;
imwrite(red_copy, 'output/ps0-3-a-1.png');

%ps0-4
green_values = img1_green(:);
max = max(green_values);
min = min(green_values);
mean = mean(green_values);
std = std(green_values);
disp(max);
disp(min);
disp(mean);
disp(std);

transformed = img1_green - mean;
imwrite(transformed, 'output/ps0-4-b-1.png');
transformed = transformed / std;
imwrite(transformed, 'output/ps0-4-b-2.png');
transformed = transformed * 10;
imwrite(transformed, 'output/ps0-4-b-3.png');
transformed = transformed + mean;
imwrite(transformed, 'output/ps0-4-b-4.png');

shifted = img1_green;
shifted(:,1:end-2) = shifted(:,3:end);
imwrite(shifted, 'output/ps0-4-c-1.png');

diff = (img1_green - shifted) + (shifted - img1_green);
imwrite(diff, 'output/ps0-4-d-1.png');

%ps0-5
noise_size = size(img1_green);
noise_sigma = 80;

noise = randn(noise_size) .* noise_sigma;
noised_green = img1_green + noise;
noised_blue = img1_blue + noise;

img2 = imread('output/ps0-1-a-1.png');
img2(:, :, 2) = noised_green;
imwrite(img2, 'output/ps0-5-a-1.png');

img3 = imread('output/ps0-1-a-1.png');
img3(:, :, 3) = noised_blue;
imwrite(img3, 'output/ps0-5-b-1.png');
