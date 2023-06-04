function [saved_positions_x, saved_positions_y, saved_theta, saved_velocities] = states(initial_state, command, tau)
k = length(command)/2;
position_x = initial_state(1);
position_y = initial_state(2);
theta = initial_state(3);
velocity = initial_state(4);
saved_positions_x = double(zeros(k, 1));
saved_positions_y = double(zeros(k, 1));
saved_theta = double(zeros(k, 1));
saved_velocities = double(zeros(k, 1));
for i = 1:k
    acceleration = command(i);
    omega = command(k + i);
    [positions_x, positions_y, positions_theta, velocities] = unicycle_model_acceleration(velocity, acceleration, omega, position_x, position_y, theta, 2, tau);
    position_x = positions_x(2);
    position_y = positions_y(2);
    theta = positions_theta(2);
    velocity = velocities(2);
    saved_positions_x(i) = positions_x(2);
    saved_positions_y(i) = positions_y(2);
    saved_theta(i) = positions_theta(2);
    saved_velocities(i) = velocities(2);
end
end