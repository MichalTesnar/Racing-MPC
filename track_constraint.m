% function passed = track_constraint(new_path_x, new_path_y, positions_theta, velocities, w)
% % load the data
% load("precompute_grid.mat");
% % compute the indices
% indices_x = floor((new_path_x-x_min)/x_size*spacing);
% indices_y = floor((new_path_y-y_min)/y_size*spacing);
% % check if they fit onto the grid
% if max(indices_x) > spacing || min(indices_x) < 1 || max(indices_y) > spacing || min(indices_y) < 1
%     passed = -1;
%     return;
% else
%     passed = 0;
% end
% % check if they are on the track
% if max(distances(sub2ind([spacing, spacing],indices_x,indices_y))) > w
%     passed = -1;
%     return;
% else
%     passed = 0;
% end
% end