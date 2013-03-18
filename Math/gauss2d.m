function [grid] = gauss2d(x_range, y_range, mu, sigma)
%GAUSS2D Computes a 2D gaussian function on a grid with the specified x and y
%values. mu and sigma must be 2x1 each
[X,Y] = meshgrid(x_range, y_range);

grid = exp(-(((X-mu(1)).^2)/(2*sigma(1))  ...
           +((Y-mu(2)).^2)/(2*sigma(2))));

end

