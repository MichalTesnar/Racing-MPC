function valid = path_checking(pathx, pathy, xp, yp, last_index, width)
% pathx, pathy is our generated path, we compare to xp and yp, which is the
% track

% if any point on the path has the closest point further away than the
% assumed half of the width of the track, then the path must be outside
% the track
    saved = 0;
    valid = true;
    for idx = 1:length(pathx)
        [index, dist] = find_closest_point_on_the_line([pathx(idx) pathy(idx)], xp, yp, last_index);
        if dist > width/2
            valid = false;
            return
        end
    end
end