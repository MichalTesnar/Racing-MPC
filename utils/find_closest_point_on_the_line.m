% finds closest point on a discretized line: returns the distance and index
function [index, closest] = find_closest_point_on_the_line(position, xp, yp, last_index)
    % note: variable 'last_index' is not being used
    [closest, index] = min(sqrt((xp-position(1)).^2+(yp-position(2)).^2));
end
