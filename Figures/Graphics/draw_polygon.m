function h = draw_polygon( Boundary , color, alpha)
%DRAW_POLYGON Draws a filled 2D polygon in 3D space
h = patch('XData', Boundary(:,1), 'YData', Boundary(:,2), 'ZData', Boundary(:,3), 'FaceColor', color, 'FaceAlpha', alpha);

end

