function h = plot_quad(radius, height, XYZpos, RPY, h)
%PLOT_QUAD Draws a simple mock quadrotor with Radius 'radius' and height 'height' at 
%[x y z]=XYZpos position with [roll pitch yaw]=RPY (ZXY euler angles)

R = RPYtoRot_ZXY(RPY(1), RPY(2), RPY(3));

oB = reshape(XYZpos, 3, 1);
crossBeam1 = [oB + radius*R(1,:)', oB - radius*R(1,:)']';
crossBeam2 = [oB + radius*R(2,:)', oB - radius*R(2,:)']';
normal = [oB + height*R(3,:)', oB]';

if(nargin < 5)
    %Redraw
    hold on
    hcross1 = plot3(crossBeam1(:,1),crossBeam1(:,2),crossBeam1(:,3),'r.-','Markersize',10);
    hcross2 = plot3(crossBeam2(:,1),crossBeam2(:,2),crossBeam2(:,3),'g.-','Markersize',10);
    hcross3 = plot3(normal(:,1),normal(:,2),normal(:,3),'c.-','Markersize',10);
    hold off
    h = [{hcross1} {hcross2} {hcross3}];
else
    set(h{1}, 'XData', crossBeam1(:,1), 'YData', crossBeam1(:,2), 'ZData', crossBeam1(:,3));
    set(h{2}, 'XData', crossBeam2(:,1), 'YData', crossBeam2(:,2), 'ZData', crossBeam2(:,3));
    set(h{3}, 'XData', normal(:,1), 'YData', normal(:,2), 'ZData', normal(:,3));

end

end

