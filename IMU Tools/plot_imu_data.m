function plot_imu_data(imu_ts, gyro_data, accel_data)
%plot_imu_data(imu_ts, gyro_data, accel_data)

ax(1) = subplot(2,1,1);
ax(2) = subplot(2,1,2);

%Plot accel
plot(ax(1), imu_ts, accel_data(1,:), imu_ts, accel_data(2,:), imu_ts, accel_data(3,:))
xlabel(ax(1), 'time')
ylabel(ax(1), 'Accel Force (g)')
legend(ax(1), 'x', 'y', 'z')

%Plot gyro
plot(ax(2), imu_ts, gyro_data(3,:), imu_ts, gyro_data(1,:), imu_ts, gyro_data(2,:))
xlabel(ax(2), 'time')
ylabel(ax(2), 'Gyro Rate (rad/s)')
legend(ax(2), 'x', 'y', 'z')

linkaxes([ax(1) ax(2)], 'x')

title('IMU Data')
