% checking if all points in an array are closer to their closest point than half of the width, if one is futher return false
function valid = path_checking(pathx, pathy, xp, yp, last_index, width)
valid = true;
for idx = 1:length(pathx)
    [~, dist] = find_closest_point_fast([pathx(idx) pathy(idx)], xp, yp, last_index);
    if dist > width/2
        valid = false;
        return
    end
end
end