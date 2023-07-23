function create_graphs(imag_1,img_2)

figure;
subplot(1, 2, 1);
imshow(imag_1);
title('Original Gray Image');

subplot(1, 2, 2);
imshow(img_2);
title('Equalized Image');

figure
subplot(1, 2, 1);
imhist(imag_1)
title('Original Gray Image Histogram');

subplot(1, 2, 2);
imhist(img_2)
title('Equalized Image Histogram');

end