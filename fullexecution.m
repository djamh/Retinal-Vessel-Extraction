%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Written by : Djamal Namoko
%% 40099428
%% Comp 478 Project
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Img=imread('DRIVE/training/images/21_training.tif');
true=imread('DRIVE/training/1st_manual/21_manual1.gif');


WideVessels = working_vesselExtract(Img,2.5, 11);
thinVessels = working_vesselExtract(Img, 1, 5);

binaryImage1 = imbinarize(rgb2gray(WideVessels));
binaryImage2 = imbinarize(rgb2gray(thinVessels));

combinedImage = binaryImage1 | binaryImage2;

figure, imshow(combinedImage, []), title('Combined Vessel Extraction');

% Calculate the number of similar pixels
similar_pixels = sum(combinedImage(:) == true(:));

% Calculate the total number of pixels
total_pixels = numel(true);

% Calculate the percentage similarity
percentage_similarity = (similar_pixels / total_pixels) * 100
