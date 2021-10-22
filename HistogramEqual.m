function [out_img] = HistogramEqual(img,type,x)

% bins is the number of graylevels
% freq is the frequency of the graylevels
% img is the inputted image
img = double(img);
%Extract the row, column and width of the image
row = size(img, 1); % Effectively the x axis
column = size(img, 2); % Effectively the y axis


bins = min(img(:)):max(img(:)); % Define graylevels directly from the image pixel values
freq = zeros(size(bins)); % Define a matrix of zeros for freq

% Create a for loop to find the number of each graylevel present in the image
for i = 1:length(bins) 
    
    graylevel = bins(i); %Select a graylevel
    bins_count = find(img==graylevel);% Find all matching graylevels in the image
    freq(i) = length(bins_count); %Define frequency as the length of the array with the matched graylevels  
end

freq(1) = 0; % zero out the occurrences in the first bin to have better histogram
freq_normal = freq./(row.*column);%Normalizing for image

% Finding the CDF
CDF = cumsum(freq_normal);

% Equalization
freq_eq=255.*CDF;

% Deriving Output Image
out_img=uint8(zeros(size(img))); % Create empty array size of original

for i = 1:row
    for j = 1:column
        r = img(i,j);% Define intensity at location (i,j)
        [x,y] = find(bins==r);% Find the original intensity location
        out_img(i,j) = freq_eq(x,y);% Match location to equalized histogram pixel
    end
end
if x == 'y'
% Plotting
figure;
subplot(2,2,1) 
imshow(img,[]); % Display Image 
colorbar;
title("Original " + type);
subplot(2,2,2)
%bar(bins,freq); % Histogram
%histogram(img);
IntensityHistogram(img,'y','nh');
xlabel('Graylevel');
ylabel('Frequency');
%axis tight;
grid;
title("Original Histogram of " + type);
subplot(2,2,3) 
imshow(out_img,[]); % Display Image 
colorbar;
title("Histogram Equalized Version of " + type);
subplot(2,2,4)
%bar(bins,freq_eq); % Histogram
%histogram(out_img);
IntensityHistogram(out_img,'y','nh');
xlabel('Graylevel');
ylabel('Frequency');
%axis tight;
grid;
title("Equalized Histogram of " + type);
else if x == 'n'
    end
end
end

