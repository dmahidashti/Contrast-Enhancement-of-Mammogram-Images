function [out_img] = HistogramEqLocal(img, kernel,type)

% bins is the number of graylevels
% freq is the frequency of the graylevels
% img is the inputted image
img = double(img);
%Extract the row, column and width of the image
row = size(img, 1); % Effectively the x axis
column = size(img, 2); % Effectively the y axis

% Loop through all pixels and their neighbours

stride = 1;

for i = 1:stride:(row-kernel(1)+1)
    for j = 1:stride:(column-kernel(2)+1)
        hold = img(i:i+2,j:j+2);
        [bins, freq] = IntensityHistogram(hold,'n','n');
        out_img(i:i+2,j:j+2) = HistogramEqual(hold,'Hi','n');
    end
end

%Convert back to uint8
out_img = uint8(out_img);

%Plotting
figure;
subplot(2,2,1)
imshow(img,[]);
colorbar;
title("Mammogram " + type + " | Original")
subplot(2,2,2)
IntensityHistogram(img,'y','y');
%histogram(img);
title("Mammogram " + type + " Histogram | Original")
ylabel('Frequency');
xlabel('Intensity Level');
subplot(2,2,3)
imshow(out_img,[]);
colorbar;
title("Mammogram " + type + " | Local Histogram Equalized")
subplot(2,2,4)
IntensityHistogram(out_img,'y','y');
%histogram(out_img);
title("Mammogram " + type + " Histogram | Local Histogram Equalized")
ylabel('Frequency');
xlabel('Intensity Level');


end

