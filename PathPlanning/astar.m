% DIJKSTRA Find the shortest path from start to goal.
%   PATH = astar(occupancy_grid, res, bounds, start, goal) returns an M-by-3 matrix, where each row
%   consists of the (x, y, z) coordinates of a point on the path.  The first
%   row is start and the last row is goal.  If no path is found, PATH is a
%   0-by-3 matrix.  Consecutive points in PATH should not be farther
%   apart than the resolution of the map.
%
%   'occupancy_grid' is a 3D boolean map with each grid that is occupied set to 1.
%   'res' is a row vector containing the resolutions of the grid in [x_res y_res z_res] format
%   'bounds' 1x6 array containing map bounds (xmin ymin zmin xmax ymax zmax)
%   'start' 1x3 start point [x y z] (in real world coords, not grid indecies)
%   'stop' 1x3 stop point [x y z] (in real world coords, not grid indecies)
function [path] = astar(occupancy_grid, res, bounds, start, goal)
javaaddpath(which('meam620utils.jar'));
path = com.upenn.meam620.AStarUtils.astar(occupancy_grid, res,...
    bounds, start, goal);
