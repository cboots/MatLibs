function [x y] = pie_slice( xc, yc, r, minang, maxang)
%PIESLICE Summary of this function goes here
%   Detailed explanation goes here

th = minang:pi/50:maxang;
x = [xc, r * cos(th) + xc, xc];
y = [yc, r * sin(th) + yc, yc];

end

