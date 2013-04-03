function h = draw_rot_rect(cx, cy, width, height, theta, COR, color, alpha, h)

    if(nargin < 5)
       theta = 0; 
    end
    
    if(nargin < 6)
        COR = [0 0];
    end
    
    
    if(nargin < 7)
        color = [1 0 0];
    end
    
    if(nargin < 8)
        alpha = 1;
    end
    
    
    vertices=[COR(1)-width/2 COR(2)-height/2;COR(1)+width/2 COR(2)-height/2;COR(1)+width/2 COR(2)+height/2;COR(1)-width/2 COR(2)+height/2];
    faces=[1 2 3 4];
    R=[cos(theta) sin(theta);-sin(theta) cos(theta)];
    rotvert = vertices*R;
    transvert = rotvert -repmat(COR, 4, 1) + [cx cy; cx cy; cx cy; cx cy;];
    if(nargin < 9)
        h = patch('Faces', faces,'Vertices',transvert, 'FaceColor', color, 'FaceAlpha',alpha);
    else
        set(h, 'Faces', faces);
        set(h, 'Vertices', transvert);
        set(h, 'FaceColor', color);
        set(h, 'FaceAlpha', alpha);
    end
    
end