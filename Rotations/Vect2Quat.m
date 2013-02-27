function q = Vect2Quat(w)

alpha_w = norm(w);
e_w = w/norm(w+eps);
q = [cos(alpha_w/2); e_w*sin(alpha_w/2)];

end
        