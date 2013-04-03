function [ Ig ] = gaussblur( I, hsize, sigma )
%GAUSSBLUR applies a gaussian blur to the image
G = fspecial('gaussian',hsize, sigma);

Ig = imfilter(I,G,'same');

end

