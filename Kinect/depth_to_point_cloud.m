function [xs ys zs indGood] = depth_to_point_cloud(I)
%%Converts the depth image to a set of points with the origin at the camera
% The x axis is along the outgoing optical axis
% I is 640x480 (the transpose of depth)
persistent yis zis

if isempty(yis)
  
  %generate and store arrays of indices
  [zis yis] = meshgrid((1:480),(1:640));
  yis = yis(:)';
  zis = zis(:)';
  
end

%convert from uint16 to double
disp2 = double(I(:))';

%get the x values (forward distance)
%slightly different from ROS values
xs = 1.03 ./ (-0.00304 .* disp2 + 3.31);

%some calibration parameters from ROS package
fx = 585.05108211;
fy = 585.05108211;
cx = 315.83800193;
cy = 242.94140713;

%calculate y and z values
ys = -(yis-cx) ./ fx .* xs;
zs = -(zis-cy) ./ fy .* xs;

%extract good values
indGood = xs > 0;
