function [out_img, T] = contrast_piecewise(img, a ,b)

%Defining r, r_max, r_min as double
img = double(img);

%Extract the row, column and width of the image
row = size(img, 1); % Effectively the x axis
column = size(img, 2); % Effectively the y axis
% Definig r1, r2, s1, s2
r1 = a(1); 
s1 = a(2);
r2 = b(1);
s2 = b(2);
% Line Gradients (slope)
a1 = a(2)/a(1); 
a2 = (b(2)-a(2))/(b(1)-a(1)); 
a3 = (255-b(2))/(255-b(1));

% Loop thorugh all pixels
for i = 1:row
    for j = 1:column
        r = img(i,j); % Define intensity at location (i,j)
        if 0 <= r && r < r1
            T(i,j) = a1*r;
        elseif r1 <= r && r < r2
            T(i,j) = (a2.*(r-r1))+s1;
        elseif r2 <= r && r < 255
            T(i,j) = a3*(r-r2)+s2;
        end
    end
end
%Convert T back to unsigned 8-bit int 
out_img = uint8(T);
% Plotting th tranform fucntion
% figure; 
% plot(unique(img),unique(T)); 
% xlabel('Input intensities (r)'); 
% ylabel('Output intensities (s)'); 
% title('Transfer Function'); 
% ylim([0 255]); 
% xlim([0 255]); 
% grid;

end

