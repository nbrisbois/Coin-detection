quarter = imread('quarter2.jpg');
penny = imread('penny2.jpg');
nickel = imread('nickel2.jpg');
dime = imread('dime2.jpg');

quarter = rgb2gray(quarter);
quarter = imbinarize(quarter,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);

penny = rgb2gray(penny);
penny = imbinarize(penny,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);

nickel = rgb2gray(nickel);
nickel = imbinarize(nickel,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);

dime = rgb2gray(dime);
dime = imbinarize(dime,'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);

quarter = imcomplement(quarter);
%figure
%imshow(quarter);

penny = imcomplement(penny);
figure
imshow(penny);

nickel = imcomplement(nickel);
%figure
%imshow(nickel);

dime = imcomplement(dime);
%figure
%imshow(dime);

%[centers1, radii1] = imfindcircles(quarter,[50 100]);
[centers2, radii2] = imfindcircles(penny,[30 80]);
[centers3, radii3] = imfindcircles(nickel,[30 80]);
[centers4, radii4] = imfindcircles(dime,[30 80]);

%viscircles(centers1, radii1, 'EdgeColor', 'r');
%display("radii1:" + radii1);

viscircles(centers2, radii2, 'EdgeColor', 'r');
display("radii2:" + radii2);

%viscircles(centers3, radii3, 'EdgeColor', 'r');
display("radii3:" + radii3);

%viscircles(centers4, radii4, 'EdgeColor', 'r');
display("radii4:" + radii4);

%radius
%quarter: 82.8962 scale --> 82.8962/64.7257 = 1.28073083798
%penny: 64.7257   
%nickel: 73.7791  scale --> 73.7791/64.7257 = 1.13987334243
%dime: 60.7747    scale --> 60.7747/64.7257 = 0.93895778647

%quarter/1.28073083798 = penny
%nickel/1.13987334243 = penny
%dime/0.93895778647 = penny
