function [ mask ] = ring_mask(innerDiameter, outerDiameter)
%CIRCLE_MASK Creates a mask that fits the diameter in pixels
% If diameter is even, an extra pixel will be added to provide a center.
% Odd diameters will fit better
if(isodd(outerDiameter))
    W = outerDiameter;
else
    W = outerDiameter+1;
end
[columnsInImage rowsInImage] = meshgrid(1:W, 1:W);

centerX = ceil(W/2);
centerY = ceil(W/2);
r1 = innerDiameter/2;
r2 = outerDiameter/2;

d2 = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2;
mask = (d2 <= r2.^2) & (d2 >= r1.^2);

end

