function rvec = gyroupdate(rvec_prev, gyro, dt)
        wx = gyro(1);
        wy = gyro(2);
        wz = gyro(3);
        
        %Quaternion update
        q_wdt = zeros(4,1);
        phi = norm([wx wy wz])*dt;
        u = [wx wy wz]/norm([wx wy wz]);
        q_wdt(1) = cos(phi/2);
        q_wdt(2:4) = sin(phi/2)*u;
        
        prev_quat = Vect2Quat(rvec_prev');
        quat_new = QuatMul(prev_quat, QuatConj(q_wdt));
        
        rvec = Quat2Vect(quat_new);
end
