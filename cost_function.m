function cost = cost_function(new_path_x, new_path_y, saved_theta, saved_velocities)
% load the data
load("precompute_grid.mat")
% unpack the state
% compute the last indices
last_index_x = floor((new_path_x(end)-x_min)/x_size*spacing);
last_index_y = floor((new_path_y(end)-y_min)/y_size*spacing);
cost = -progresses(last_index_x, last_index_y);
end