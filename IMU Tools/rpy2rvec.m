function rvec = rpy2rvec(roll, pitch, yaw)
    %Cludge, could be more efficient
    rvec = Quat2Vect(RotToQuat(RPYtoRot_ZXY(roll,pitch,yaw)'));
end