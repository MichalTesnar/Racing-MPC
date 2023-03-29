% constants hashmap, which is also made global
w = 0.2;
keySet = ["tau", "width", "steps", "horizons", "global_steps", "min_speed", "max_speed", "max_acceleration", "max_brake", "steer_change", "lateral_acceleration", "max_steer", "intervals"];
valueSet = [0.01   w        1000         3         1500          1                100            12              12            pi/6               50                  pi/3           3];
global constant; constant = containers.Map(keySet, valueSet);
% random vector of starting commands
r_acceleration = (constant("max_acceleration") -- constant("max_brake")).*rand(constant("steps"),1) - constant("max_brake");
r_omega = (constant("steer_change") -- constant("steer_change")).*rand(constant("steps"),1) - constant("steer_change");
u_vector = [r_acceleration r_omega]; 
global x0; x0 = [0, 0, 0, 0];
[saved_positions_x, saved_positions_y, saved_theta, saved_velocities] = states(x0, u_vector, constant("tau"));
cost = cost_function(saved_positions_x, saved_positions_y, saved_theta, saved_velocities);
% saved_positions_x
t = track_constraint(saved_positions_x, saved_positions_y, saved_theta, saved_velocities, constant("width"));

% maximum acceleration and maximum omega
u_vector(:,1) < constant("max_acceleration");
u_vector(:,1) > -constant("max_brake");
u_vector(:,2) < constant("max_steer");
u_vector(:,2) > -constant("max_steer");

% constraint the path: distance
track_constraint(saved_positions_x, saved_positions_y, saved_theta, saved_velocities, constant("width")) % = 1;
saved_velocities < constant("max_speed");
saved_velocities > constant("min_speed");
% skipping lateral acceleration for now

% problem
fun = @cost_wrapper;
u0 = u_vector;
% A = repelem([1, 1], constant("steps"));
A = eye(constant("steps"));
A = kron(A, ones(1,2));
size(A)
b = repelem([constant("max_acceleration")], constant("steps"));
b = b';
size(u0)
size(b)
Aeq = [];
beq = [];
lb = [];
ub = [];
nonlcon = [];
for i = 1:10
    % cost_wrapper(u0)
    u = fmincon(fun,u0,A,b,Aeq,beq,lb,ub,nonlcon);
    u
end



function cost = cost_wrapper(u_vector)
global x0
global constant
[saved_positions_x, saved_positions_y, saved_theta, saved_velocities] = states(x0, u_vector, constant("tau"));
cost = cost_function(saved_positions_x, saved_positions_y, saved_theta, saved_velocities);
end
