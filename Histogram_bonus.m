function [bins , freq] = Histogram_bonus(img)


img = double(img); %lab2
    
    bins = min(img(:)):max(img(:)); %Graylevels
    freq = zeros(size(bins)); %number of each graylevel
    row = size(img,1);
    col = size(img,2);
    z = size(img,3);
    
    for i = 1:length(bins)
        a = bins(i);
        idx = find(img==a);
        freq(i) = length(idx);
    end
    img = uint8(img); %lab2
    
end

