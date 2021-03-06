function distance = pointDistanceToSegment(p, p0, p1)
    x = p.x; y = p.y;
    x1 = p0.x; y1 = p0.y;
    x2 = p1.x; y2 = p1.y;
    A = x - x1; B = y - y1; C = x2 -x1; D = y2 - y1;
    dot = A*C - B*D;
    len_sq = C*C + D*D;
    param = -1;
    if len_sq ~= 0
        param = dot / len_sq;
    end
    xx = 0; yy = 0;
    if param < 0
        xx = x1; yy = y1;
    elseif param > 1
        xx =  x2; yy = y2;
    else
        xx = x1 + param*C;
        yy = y1 + param*D;
    end
    dx = x - xx; dy = y - yy;
    distance = sqrt(dx*dx + dy*dy);
end

