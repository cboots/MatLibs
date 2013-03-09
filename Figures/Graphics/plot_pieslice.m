function h = plot_pieslice( xc, yc, r, minang, maxang)
    [x y] = pieslice( xc, yc, r, minang, maxang);
    h = plot(x,y);
end