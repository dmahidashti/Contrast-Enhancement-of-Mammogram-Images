function [out_img,r,s] = contrast_highlight(img, A, B, I_min)

%Defining r, r_max, r_min as double
img = double(img);

%Extract the row, column and width of the image
row = size(img, 1); % Effectively the x axis
column = size(img, 2); % Effectively the y axis

% Define r_max and r_min
r_max = max(img(:));
r_min = min(img(:));

% Loop thorugh all pixels
T = zeros(row, column);
for i = 1:row
    for j = 1:column
        r = img(i,j); % Define intensity at location (i,j)
        if A <= r && r <= B
            T(i,j) = r;
        else
            T(i,j) = I_min;
        end
    end
end

%Convert T back to unsigned 8-bit int 
out_img = uint8(T);

% Plotting transformation function
% Section 1
r1 = [1:A-1]; % From origin to A
s1 = ones(1,A-1)*I_min; % Origin to A, at step of 1
% Section 2
r2 = [A:B]; % Constant A to B
s2 = [A:B]; % Constant A to B
% Section 3
r3 = [B+1:r_max]; % From B to max intensity
s3 = ones(1,(r_max-B))*I_min; % From B, steps of 1 to max
% Place all in a single array
r = cat(2,r1,r2,r3);
s = cat(2,s1,s2,s3);    
% Plotting
figure;
plot(r,s);
xlabel('Input Intensity (r)');
ylabel('Output Intensity (s)');
title('Transform Function');
ylim([0 255]);
xlim([0 255]);
grid;

end

