function ret = approxPolySimple(polyline)
    epsilon = float(0.1);
    if polyline.size(0) <= 2
        ret = polyline;
        return;
    end
    ret = [];
    ret(end+1) = polyline(0);
    for i = 1:polyline.size - 1
        d = pointDistanceToSegment(polyline(i), polyline(i-1), polyline(i+1));
        if d > epsilon
            ret(end + 1) = Point(polyline(0));
        end
    end
    ret(end + 1) = Point(polyline(end -1));
    return;
end

