%Function load_png
%   Collin Boots
%   1/17/2013
%
function [I,map] = load_png(filename)

[I,map] = imread(filename,'png');