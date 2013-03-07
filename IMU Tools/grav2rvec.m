function rvec = grav2rvec(grav)
gravn = grav/sqrt(sum(grav.^2));
th = acos(gravn(3));
V = [gravn(2); -gravn(1); 0];
% q = [cos(th/2); sin(th/2)*V/norm(V)];
rvec = th*V;

end