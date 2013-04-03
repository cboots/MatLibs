function clipped = extract_window(I, mask, xc, yc)
%Returns a region the size of mask containing data from I masked by mask
%centered at (xc,yc). Mask must be square and of odd dimensions
if(size(mask,1) ~= size(mask,2))
    error('Mask must be square');
end
if(any(iseven(size(mask))))
    error('Mask must have odd dimensions')
end

clipped = zeros(size(mask));
W = size(mask,1);
width = size(I,2);
height = size(I,1);
R = floor(W/2);

cminx = 1+max(0,R-xc+1);
cminy = 1+max(0,R-yc+1);
cmaxx = W+min(0,width-xc-R);
cmaxy = W+min(0,height-yc-R);
if(any([cminx cminy cmaxx cmaxy] < 1))
    warning('Mask out of range')
    return;
end
clipped(cminy:cmaxy,cminx:cmaxx) = ...
    I(range_limit(yc-R,1,height):range_limit(yc+R,1,height),...
        range_limit(xc-R,1,width):range_limit(xc+R,1,width));
    
clipped = clipped .* mask;
end