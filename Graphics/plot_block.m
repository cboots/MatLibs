function plot_block(bounds, r, b, g, alpha)
if(nargin < 5)
    alpha = 1;
end
fm = [1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8];
vm = [0 0 0; 1 0 0; 1 1 0; 0 1 0; 0 0 1; 1 0 1; 1 1 1; 0 1 1];
vertsx = vm(:,1);
vertsx(vm(:,1) == 0) = bounds(1);
vertsx(vm(:,1) == 1) = bounds(4);

vertsy = vm(:,2);
vertsy(vm(:,2) == 0) = bounds(2);
vertsy(vm(:,2) == 1) = bounds(5);

vertsz = vm(:,3);
vertsz(vm(:,3) == 0) = bounds(3);
vertsz(vm(:,3) == 1) = bounds(6);

verts = [vertsx vertsy vertsz];
patch('Vertices',verts,'Faces',fm, 'FaceVertexCData',repmat([r g b], 6, 1),'FaceColor','flat','FaceAlpha',alpha); 

end