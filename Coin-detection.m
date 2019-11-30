I = im2double(imread('IMG_20191026_143739.jpg'));
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
    disp(c);
    for i = round(centers(c, 1)) - corner:round(centers(c, 1)) + corner
        for j = round(centers(c, 2)) - corner: round(centers(c, 2)) + corner            
            scan = scan + 1;
            greAve = greAve + I(j, i, 3);
            redAve = redAve + I(j, i, 1);
            I(j, i, :) = [255,255,255];
        end
    end
    imshow(I);
    pause();
    greAve = greAve/power(corner*2+1,2);
    redAve = redAve/power(corner*2+1,2);
    if((greAve-redAve)>.12)
        numPen = numPen + 1;
        penAve = penAve + radii(c);
        tempCen(c, 1) = 0;
        tempCen(c, 2) = 0;
    end
end
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
            break;
        end
    end
end
total = (numPen*.01) + (numNic*.05) + (numDim*.1) + (numQua*.25);

I = imcomplement(I);
imshow(I);
viscircles(centers, radii, 'EdgeColor', 'r');
