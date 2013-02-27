function w = Quat2Vect(q)
%Inverse of
% alpha_w = norm(w);
% e_w = w/norm(w+eps);
% q = [cos(alpha_w/2); e_w*sin(alpha_w/2)];

alpha = 2*acos(q(1));
if(alpha == 0)
    w = [0;0;0];
else
    e_w = q(2:4)/sin(alpha/2);
    w = e_w*alpha;
end
end