function h = display_error(ax_h)

im =randi(6, 1);
error = load_jpg(['error' num2str(im) '.jpg']);
axes(ax_h);
h = image(error);
end
