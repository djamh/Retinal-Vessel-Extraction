%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Written by : Djamal Namoko
%% 40099428
%% Comp 478 Project
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function finImage = working_vesselExtract(Img,s,L)

%% Preprocessing
% Resize image 
I = imresize(Img, [584 565]);
%figure, imshow(I),title('original Image');
% to double
im = im2double(I);
% to gray
Ogray = rgb2gray(im);
A = adapthisteq(Ogray,'numTiles',[8 8],'nBins',128);
%figure, imshow(A), title('preprocessedImage');


%% Filters
% Set the parameters for filtering, remove hardcoding
%s = 1;
%L = 5;

% Create MF filter
 MFfilter = createGaussianFilter(L, s);

% Create FDOG filter
 FDOGfilter = createFDOGFilter(L, s);

% Apply MF filter
MF = imfilter(A, MFfilter,'same', 'replicate');
%figure, imshow(MF),

% Keep difference between the gray image and Matched Filter
Z = imsubtract(MF, A);
%figure, imshow(Z),title('Response map with MF filter');

% Apply FDOG Filter
D = imfilter(A, FDOGfilter,'same', 'replicate');
%figure, imshow(D),title('Response map with FDOG filter');


% Calculate threshold
Dm = calculateLocalMeanNormalized(D);
T = calculateThreshold(Dm, MF); 

% Check the class/type of T
%disp(['Data type of T: ', class(T)]);
% Check the range of values in T
%disp(['Minimum value in T: ', num2str(min(T(:)))]);
%disp(['Maximum value in T: ', num2str(max(T(:)))]);

%T_min = min(T(:)); % Replace with actual min if known
%T_max = max(T(:)); % Replace with actual max if known

% Normalize T to [0, 1]
%T = (T - T_min) / (T_max - T_min);


% Apply threshold with binary, not using default Otsu, but rather custom
% threshold
Bi = imbinarize(Z, T);
%figure, imshow(Bi)
%title('BinImage');




%% Post Processing

% Remove small objects
%Bi2 = bwareaopen(Bi, 150);
SE = strel('square', 1);
Bi2 = imopen(Bi , SE);

Bi2 = bwareaopen(Bi2, 100);

% Add back the color
Bi2 = imcomplement(Bi2);
finImage = imoverlay(I, Bi2, [0 0 0]);
%figure, imshow(finImage),title('Final thresholded and processed Image');