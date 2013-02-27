%alphamask(mask, color, alpha)
% Overlays a boolean mask with the specified color and alpha transparency
% Color is a 3D vector containging the rgb value of the mask.
function alphamask(mask, color, alpha)
rgbI = cat(3, repmat(color(1), size(mask)), repmat(color(2), size(mask)), repmat(color(3), size(mask)));
hold on,
h = imshow(rgbI);
set(h, 'AlphaData', mask*alpha);  
hold off;
