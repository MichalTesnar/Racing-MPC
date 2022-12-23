clear all; clc;
close all; drawnow;

keySet = ["tau", "width", "steps", "global_steps"];
valueSet = [0.01 0.2 50 300];
constant = containers.Map(keySet,valueSet);

% generating track
test_path_x = (1:800)/20;
test_path_y = 0.2*sin(0.5*test_path_x);
bound_upper = test_path_y + constant("width")/2;
bound_lower = test_path_y - constant("width")/2;

% starting position of the model
start_x = 0;
start_y = 0;
start_theta = 0.02;

% temporary variables to keep track of the progress
global best; % best progress along the line
best = 0;
global best_v; % best velocity
best_v = 0;
global best_omega % best omega
best_omega = 0;
global best_x; % best path we have taken x
best_x = double(zeros(constant("steps")));
global best_y; % best path we have taken y
best_y = double(zeros(constant("steps")));

% storing the path we actually took
global taken_x;
taken_x = zeros(constant("global_steps"), 1);
taken_x(1) = start_x;
global taken_y;
taken_y = zeros(constant("global_steps"), 1);
taken_y(1) = start_y;
global taken_omega;
taken_omega = zeros(constant("global_steps"), 1);
global taken_velocity;
taken_velocity = zeros(constant("global_steps"), 1);
taken_velocity(1) = 0;


global last_index;
last_index = 0;

% main loop
for a = 2:constant("global_steps")
    for velocity = 5:15 % try velocities
        for angle = -10:10 % try angles

            % constraint the lateral acceleration
            omega = angle/30;
            lateral_acceleration = omega*velocity;


            if lateral_acceleration < 4
                % let the model move in that way
                [path_x, path_y, ~] = unicycle_model(velocity, omega, start_x, start_y, start_theta, constant("steps"), constant("tau"));
                

                valid = path_checking(path_x, path_y, test_path_x, test_path_y, last_index, constant("width"));
                if valid == true % if valid, take find closest point to the last point
                    global best
                    best = 0;
                    [progress, distance] = find_closest_point_on_the_line([path_x(constant("steps")), path_y(constant("steps"))], test_path_x, test_path_y, last_index);
                    if progress > best % update maximum
                        best = progress;
                        best_v = velocity;
                        best_omega = omega;
                        best_x = path_x;
                        best_y = path_y;
                    end
                end
            end
        end
    end
    [path_x, path_y, path_theta] = unicycle_model(best_v, best_omega, start_x, start_y, start_theta, 2, constant("tau"));
    start_x = path_x(2);
    start_y = path_y(2);
    start_theta = path_theta(2);
    taken_x(a) = start_x;
    taken_y(a) = start_y;
    taken_omega(a) = best_omega;
    taken_velocity(a) = best_v;
    
end

% plotting all the curves
figure

% reference path to follow
% plot(test_path_x, test_path_y, "o");
% hold on

% upper bound
plot(test_path_x, bound_upper, 'ob', 'MarkerSize',1);
hold on

% lower bound
plot(test_path_x, bound_lower, 'oy', 'MarkerSize',1);
hold on

% path the model took
scatter(taken_x, taken_y, 200*abs(taken_omega)+0.000001, taken_velocity+1, 'filled');
    % color = speed
    % size of the marker = absolute size of the angle
% fixating the axes
axis([0 40 -1 1])