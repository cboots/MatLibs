function Quat = QuatMul(q, p)
Quat = zeros(4,1);
Quat(1) = q(1)*p(1)-q(2:4)'*p(2:4);
Quat(2:4) = q(1)*p(2:4) + cross(q(2:4),p(2:4)) + p(1)*q(2:4);

Quat = Quat/sqrt(sum((Quat).^2));