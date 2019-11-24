I = imread('mixed.jpg');
I = lin2rgb(I);
I = imresize(I, 0.25);

I = imcomplement(I);
numPen = 0;
numOfCoin = size(centers);
penLoc = zeros(numOfCoin, 2, 'uint8');
UnId = penLoc;
[centers, radii] = imfindcircles(I, [10 100]);

for c = 1: numOfCoin
    corner = round(radii(c)/2);
    cop = 0;
    for i = centers(c, 1) - corner:centers(c, 1) + corner
        for j = centers(c, 2) - corner: centers(c, 2) + corner
            if(I(i,j,1) > 68 && I(i,j,1) < 76 && I(i,j,2) > 41 && I(i,j,2) < 49)
                cop = cop + 1;
            end
        end
    end
    if(cop/3)
        numPen = numPen + 1;
        penLoc(numPen, 1) = centers(numPen, 1);
        penLoc(numPen, 2) = centers(numPen, 2);
    else
        penLoc(c, 1) = centers(c, 1);
        penLoc(c, 2) = centers(c, 2);
    end
end
I = imcomplement(I);
imshow(I);
viscircles(centers, radii, 'EdgeColor', 'r');
