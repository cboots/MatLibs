function [ mask ] = circle_mask(diameter)
%CIRCLE_MASK Creates a mask that fits the diameter in pixels
% If diameter is even, an extra pixel will be added to provide a center.
% Odd diameters will fit better
if(isodd(diameter))
    W = diameter;
else
    W = diameter+1;
end
[columnsInImage rowsInImage] = meshgrid(1:W, 1:W);

centerX = ceil(W/2);
centerY = ceil(W/2);
radius = diameter/2;

mask = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2 <= radius.^2;

end

