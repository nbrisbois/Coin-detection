I = im2double(imread('mixed.jpg'));
I = lin2rgb(I);
I = imresize(I, 0.25);

I = imcomplement(I);


[centers, radii] = imfindcircles(I, [10 100]);
numOfCoin = length(radii());
tempCen = centers;
numPen = 0;
numQua = 0;
numDim = 0;
numNic = 0;
penAve = 1;

for c = 1: numOfCoin
    corner = round(radii(c)/sqrt(2));
    cop = 0;
    scan = 0;
    greAve = 0;
    redAve = 0;
    for i = round(centers(c, 1)) - corner:round(centers(c, 1)) + corner
        for j = round(centers(c, 2)) - corner: round(centers(c, 2)) + corner            
            scan = scan + 1;
            greAve = greAve + I(j, i, 3);
            redAve = redAve + I(j, i, 1);
        end
    end
    greAve = greAve/power(corner*2+1,2);
    redAve = redAve/power(corner*2+1,2);
    if((greAve-redAve)>.12)
        numPen = numPen + 1;
        penAve = penAve + radii(c);
        tempCen(c, 1) = 0;
        tempCen(c, 2) = 0;
    end
end
if(numPen > 0) 
    penAve = penAve/numPen;

    for c = 1: numOfCoin
        if(tempCen(c, 1) > 0 || tempCen(c, 2) > 0)
            if((penAve*1.2735)*.94 < radii(c) && (penAve*1.2735)*1.2 > radii(c))
                numQua = numQua + 1;
            elseif((penAve*1.1134)*.95 < radii(c) && (penAve*1.1134)*1.05 > radii(c))
                numNic = numNic + 1;
            elseif((penAve*.9402)*.8 < radii(c) && (penAve*.9402)*1.05 > radii(c))
                numDim = numDim + 1;
            else
                class = ImgMatch(I, radii(c), centers(c, 1), centers(c,2));
            end
        end
    end
    total = (numPen*.01) + (numNic*.05) + (numDim*.1) + (numQua*.25);
else
    
end

I = imcomplement(I);
imshow(I);
viscircles(centers, radii, 'EdgeColor', 'r');


function[classification] = ImgMatch(img, radii, x, y)
    corner = round(radii/sqrt(2));
    segment = zeros(corner*2+1, corner*2+1, 3, 'double');
    i1 = 1;
    for i = round(x) - corner:round(x) + corner
        j1 = 1;
        for j = round(y) - corner: round(y) + corner            
            segment(i1,j1, :) = img(j,i,:);
            j1 = j1 + 1;
        end
        i1 = i1 + 1;
    end
    nikTail = imread('Nickletail.jpg');
%    count = matchFeatures(segment, nikTail);
    classification = 1;
end
