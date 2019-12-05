I = imread('coins.tif');
I = rgb2gray(I);
bw = imbinarize(I,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);

bw = imcomplement(bw);
imshow(bw);

[centers, radii] = imfindcircles(bw,[20 40]);

viscircles(centers, radii, 'EdgeColor', 'r');
