I = imread('mixed.jpg');
I = lin2rgb(I);
I = imresize(I, 0.25);

I = imcomplement(I);
imshow(I);

[centers, radii] = imfindcircles(I, [10 100]);
numCoin = size(centers);
DimCou = zero(numCoin, 2);
PenCou = zero(numCoin, 2);
NicCou = zero(numCoin, 2);
QuaCou = zero(numCoin, 2);
dim = 0;
pen = 0;
nic = 0;
qua = 0;
max = 20;
min = 10;
magicFour = 0
for r = 0: 100
    [centers, radii] = imfindcircles(I, [min max]);
    if(centers == 0) 
        max = round(max/.8);
        min = round(min/.9);
    end
    
            
end
viscircles(centers, radii, 'EdgeColor', 'r');

function result = isPen(center, radii)
end
