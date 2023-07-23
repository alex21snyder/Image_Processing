%% Histogram Equalization Project %%
%{
This program enhances the contrast of an image using the Histogram Equalization method.
To change the image being enhanced edit the file name in Step 1.
Make sure to save the Main file, equalization_rev02 function, create_graphs function, and
the image being enhanced in the same folder/directory before running.
%}
clc
clear
close all

% Step 1: Read image that needs contrast enhanced
input_img = imread('kids.tif');

% Step 2: Call the equalization function
[original_gray_img, enhanced_img] = equalization_rev02(input_img);

%Step 3: Call the create_graphs function
create_graphs(original_gray_img, enhanced_img);



% -ALEX 23
