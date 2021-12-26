function ret  = approxPolyDP(polyline, epsilon)
    if polyline.size(0) <= 2
        ret = polyline;
        return;
    end
    dmax = 0;
    argmax = -1;
    for i = 1:polyline.size(0)-1
        d = pointDistanceToSegment(polyline(i), polyline(0), polyline(end));
        if d > dmax
            dmax = d;
            argmax = i;
        end
    end
    ret = [];
    if dmax > epsilon
        L = approxPolySimple(polyline(0:argmax + 1), epsilon);
        R = approxPolySimple(polyline(argmax:end), epsilon);
        ret = [ret, L, R];
    else
        ret(end + 1) = polyline(0);
        ret(end + 1) = polyline(end);
    end
    return;
end

