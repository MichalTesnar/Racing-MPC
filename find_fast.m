function [index, closest] = find_fast(position, xp, yp, last_index)
    last_index = max(last_index-5, 1);
%     [closest, idx] = min(sqrt((xp(last_index:min(last_index+400, 500))-position(1)).^2+(yp(last_index:min(500, last_index+400))-position(2)).^2));
    [closest, idx] = min(sqrt((xp(last_index:last_index+90)-position(1)).^2+(yp(last_index:last_index+90)-position(2)).^2));
    index = idx+last_index;
end
