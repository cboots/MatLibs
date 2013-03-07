function h = draw_rot_rect(cx, cy, width, height, theta, color, alpha, h)
    if(nargin < 5)
       theta = 0; 
    end
    
    if(nargin < 6)
        color = [1 0 0];
    end
    
    if(nargin < 7)
        alpha = 1;
    end
    
    vertices=[cx-width/2 cy-height/2;cx+width/2 cy-height/2;cx+width/2 cy+height/2;cx-width/2 cy+height/2];
    faces=[1 2 3 4];
    R=[cos(theta) sin(theta);-sin(theta) cos(theta)];
    if(nargin < 8)
        h = patch('Faces', faces,'Vertices',vertices*R, 'FaceColor', color, 'FaceAlpha',alpha);
    else
        set(h, 'Faces', faces);
        set(h, 'Vertices', vertices*R);
        set(h, 'FaceColor', color);
        set(h, 'FaceAlpha', alpha);
    end
    
end