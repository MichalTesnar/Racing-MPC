% searching for the closest point on the faster by checking only 90 points ahead
function [index, closest] = find_closest_point_fast(position, xp, yp, last_index)
    last_index = max(last_index-5, 1); % decrease index if possible
    [closest, idx] = min(sqrt((xp(last_index:last_index+90)-position(1)).^2+(yp(last_index:last_index+90)-position(2)).^2));
    index = idx + last_index; % add last_index back in
end

% warning: using this function may cause problems if the lookahead horizon reaches points bigger than 90, then it might give wrong results
