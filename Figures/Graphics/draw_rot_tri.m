function h = draw_rot_tri(cx, cy, base, altitude, theta, color, alpha, z, h)
%Draws an isosceles triangle with unique base of width 'base' and altitute
%'altitude'. the midpoint of the base will be placed at (cx, cy) and will
%be rotated about that midpoint by theta. (Triangle pointed along x axis for
%theta = 0)

    if(nargin < 5)
       theta = 0; 
    end
    
    if(nargin < 6)
        color = [1 0 0];
    end
    
    if(nargin < 7)
        alpha = 1;
    end
    
    if(nargin < 8)
        z = 0;
    end
    
    vertices=[0 -base/2 z;0 base/2 z;altitude 0 z];
    faces=[1 2 3];
    R=[cos(theta) sin(theta) 0;-sin(theta) cos(theta) 0; 0 0 1];
    rotVert = vertices*R;%Rotate
    rotVert = rotVert+repmat([cx cy 0], 3, 1);%Translate
    if(nargin < 9)
        h = patch('Faces', faces,'Vertices',rotVert, 'FaceColor', color, 'FaceAlpha',alpha);
    else
        set(h, 'Faces', faces);
        set(h, 'Vertices', rotVert);
        set(h, 'FaceColor', color);
        set(h, 'FaceAlpha', alpha);
    end
    
end