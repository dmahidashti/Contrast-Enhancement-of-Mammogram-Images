function [LUT, out_img] = contrast_tfrm_curve(img, T)

%Defining image and T as double, since interp1 requires values as doubles
img = double(img);
T = double(T);
%Extract the row, column and width of the image
row = size(img, 1); % Effectively the x axis
column = size(img, 2); % Effectively the y axis

%Creating LUT
LUT = interp1(unique(T),unique(img)); % interp1 will map the T and img intensities, unique will order all vlaues from lowest to highest
% Unique is needed to get a clean, ordered LUT
disp(LUT);

% Defining transform function T
for i = 1:row
    for j = 1:column
        r = img(i,j); % Define intensity at location (i,j)
        out_img(i,j) = LUT(r+1); %Output image equals corresponding LUT values
    end
end

%Convert T back to unsigned 8-bit int 
out_img = uint8(out_img);



end

