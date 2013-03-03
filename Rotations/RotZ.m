function r = RotZ(t)

% Homogeneous transformation representing a rotation of theta
% about the Z axis.
% t is rotation angle in radians.

ct = cos(t);
st = sin(t);
r =    [ct	-st	0	0
        st	ct	0 0
        0	   0	1	0
        0	   0	0	1];
