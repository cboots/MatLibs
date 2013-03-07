function h = rotplot(R, ax_h,h)
% This is a simple function to plot the orientation
% of a 3x3 rotation matrix R in 3-D
% You should modify it as you wish for the project.


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



if(nargin < 3)
    %Redraw
    h(1:2) = plot3(xp(1,itop), xp(2,itop), xp(3,itop), 'k-', ...
          xp(1,ibottom), xp(2,ibottom), xp(3,ibottom), 'k-');
    hold on;
    h(3) = patch(xp(1,ifront), xp(2,ifront), xp(3,ifront), 'b');
    h(4) = patch(xp(1,iback), xp(2,iback), xp(3,iback), 'r');
else
    set(h(1), 'XData', xp(1,itop), 'YData', xp(2,itop), 'ZData', xp(3,itop));
    set(h(2), 'XData', xp(1,ibottom), 'YData', xp(2,ibottom), 'ZData', xp(3,ibottom));
    set(h(3), 'XData', xp(1,ifront), 'YData', xp(2,ifront), 'ZData', xp(3,ifront));
    set(h(4), 'XData', xp(1,iback), 'YData', xp(2,iback), 'ZData', xp(3,iback));
    
end

hold off;

axis(ax_h, [-2 2 -2 2 -2 2]);

