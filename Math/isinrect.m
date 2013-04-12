function [ isin ] = isinrect( P, xc, yc, width, height, theta)
%ISINRECT Summary of this function goes here
%   Detailed explanation goes here


c = cos(-theta);
s = sin(-theta);
        
rotatedX = xc + c * (P(:,1) - xc) - s * (P(:,2) - yc);
rotatedY = yc + s * (P(:,1) - xc) + c * (P(:,2) - yc);
        
leftX = xc - width/2;
rightX = xc + width/2;
bottomY = yc - height/2;
topY = yc + height/2;
isin = leftX <= rotatedX & rightX >= rotatedX & bottomY <= rotatedY & topY >= rotatedY;
end

