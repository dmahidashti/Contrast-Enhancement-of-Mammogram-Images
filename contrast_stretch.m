function [T] = contrast_stretch(img)

%Defining r, r_max, r_min as double
img = double(img);
double r
double r_max
double r_min
% Define r_max and r_min
r_max = max(img(:));
r_min = min(img(:));
%Extract the row, column and width of the image
row = size(img, 1); % Effectively the x axis
column = size(img, 2); % Effectively the y axis

% Defining transform function T
T = zeros(row,column); % Empty matrix
for i = 1:row
    for j = 1:column
        r = img(i,j); % Define intensity at location (i,j)
        T(i,j) = 255.*(((1./(r_max-r_min)).*r)-(r_min./(r_max-r_min)));
    end
end

%Convert T back to unsigned 8-bit int 
T = uint8(T);

% % Plotting th tranform fucntion
% figure; 
% plot(unique(img),unique(T)); 
% xlabel('Input intensities (r)'); 
% ylabel('Output intensities (T(r))'); 
% title('Contrast Transfer Function'); 
% ylim([0 255]); 
% xlim([0 255]); 
% grid;
end

