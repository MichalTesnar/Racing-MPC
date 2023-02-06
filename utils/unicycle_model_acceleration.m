% unicycle model function to 'predict the future' movement of the model
function [positions_x, positions_y, positions_theta] = unicycle_model(velocity, omega, current_x, current_y, current_theta, k, tau)
    % initiate arrays for future positions and angle
    positions_x = double(zeros(k, 1));
    positions_y = double(zeros(k, 1));
    positions_theta = double(zeros(k, 1));
    % set first values of those arrays
    positions_x(1) = current_x;
    positions_y(1) = current_y;
    positions_theta(1) = current_theta;
    % iteratively compute the future behavior of the model
    for i = 2:k
        positions_x(i) = positions_x(i-1) + tau*velocity*cos(positions_theta(i-1));
        positions_y(i) = positions_y(i-1) + tau*velocity*sin(positions_theta(i-1));
        positions_theta(i) = positions_theta(i-1) + tau*omega;
    end
end