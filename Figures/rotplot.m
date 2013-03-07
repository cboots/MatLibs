function h = rotplot(R, accel_vect, axes_handle)
% This is a simple function to plot the orientation
% of a 3x3 rotation matrix R in 3-D
% You should modify it as you wish for the project.

if(nargin < 3)
    axes_handle = gca;
end

if(nargin < 2)
    accel_vect = [0;0;0];
end


lx = 3.0;
ly = 1.5;
lz = 1.0;

x = .5*[+lx -lx +lx -lx +lx -lx +lx -lx;
        +ly +ly -ly -ly +ly +ly -ly -ly;
        +lz +lz +lz +lz -lz -lz -lz -lz];

xp = R*x;
ifront = [1 3 7 5 1];
iback = [2 4 8 6 2];
itop = [1 2 4 3 1];
ibottom = [5 6 8 7 5];
axes(axes_handle);
plot3(xp(1,itop), xp(2,itop), xp(3,itop), 'k-', ...
      xp(1,ibottom), xp(2,ibottom), xp(3,ibottom), 'k-');
hold on;
patch(xp(1,ifront), xp(2,ifront), xp(3,ifront), 'b');
patch(xp(1,iback), xp(2,iback), xp(3,iback), 'r');

plot_arrow([0 0 0], accel_vect);
% line([0 accel_vect(1)], [0 accel_vect(2)], [0 accel_vect(3)], 'LineWidth', 5);
hold off;

axis(axes_handle, [-2 2 -2 2 -2 2]);

