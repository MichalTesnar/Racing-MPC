function [index, closest] = find_closest_point_on_the_line(position, xp, yp, last_index)
    [closest, index] = min(sqrt((xp-position(1)).^2+(yp-position(2)).^2));
end

% refine changes in constraints with respect to the last position
% refine the grid of options to search
% do parameter search base on how far along the track we go
% optimize search on the track - matlab tricks, convex optimization, last
% point and lookhead horizon, search track just from the point where you were
% put it on github repository
