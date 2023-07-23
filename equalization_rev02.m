function [imag_1,imag_2] = equalization_rev02(img)


% Step 1: Make sure Image is Gray
if size(img, 3) > 1
    imag_1 = rgb2gray(img);
else
    imag_1 = img;
end

% Step 2: Calculate the histogram of OG picture.
hist_img = imhist(imag_1);

% Step 3: Calculate total number of pixles (each pixle has an amplitude
%value).
number_of_pixles = sum(hist_img, "all");

% Step 4: Calculate ratio of each amplitude compared to all 256 values.
ratio_of_each_amplitude=hist_img/number_of_pixles;

% Step 5: Calculate accumulated probability for ratio of each amplitude
%starting from 0 going to 255.
accumulated_probability_for_each_amplitude=cumsum(ratio_of_each_amplitude);

% Step 5: Calculate the number of histogram values that can be shown. Should always be 256 total (0-255).
number_of_histogram_values=length(hist_img);  

% Step 6: Output of equalized image (s) is pre defined for speed.
s=[0;0];

% Step 7: Enhanced_img is pre defined for speed.
imag_2=zeros(height(imag_1),width(imag_1));

% Step 8: Calculate s (the output amplitude for each input amplitude)
for i = 1:number_of_histogram_values
   s(i)=(number_of_histogram_values-1)*accumulated_probability_for_each_amplitude(i);
   s(i)=round(s(i));
end

% Step 9: Fill in the enhanced_img values. If the histogram value i-1 is in
%the og image, change it to the value s(i).
for i = 1:number_of_histogram_values
    imag_2(imag_1==i-1)=s(i); %i-1 accounts for shifting from 1-256 to 0-255 in the gray_imag.
end

% Step 10: Change enhanced_img data type from double to uin8 for display.
imag_2=uint8(imag_2);

end



