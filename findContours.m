function contours = findContours(F, w, h)
    N_PIXEL_NEIGHBOR = 8;
    %Tránh mất tính tổng quát, giả sử 0-pixel lấp đấy frame ảnh nhị phân
    nbd = 1;
    lnbd = 1;
    contours = Contour;
    for i = 1:h-2
        F(i*h) = 0;
        F(1*w + w + 1) = 0;
    end
    for i = 1:w-1
        F(i)=0;
        F(w*h - 1 - i) = 0;
    end
    for i = 1:h-2
        lnbd = 1;
        for j=1:w-2
            i2 = 0; j2 =0;
            if F(i*w+j)==0
                continue;
            end
        if F(i*w+j) == 1 && F(i*w+(j-1))==0
            nbd = nbd + 1;
            i2 = i;
            j2 = j - 1;
        elseif F(i*w+j) >= 1 && F(i*w+j+1) == 0
            nbd = nbd + 1;
            i2 = i;
            j2 = j + 1;
            if F(i*w+j)>1
                lnbd = F(i*w+j);
            end
        else
            if F(i*w+j) ~= 1
                lnbd = abs(F(i*w + j));
                continue;
            end
        end
        B = Contour;
        B.points = [];
        B.points = [B.points Point(j, i)];
        B.isHole = j2 == j + 1;
        B.id = nbd;
        contours(end + 1) = B;
        
        B0 = Contour;
        for c = 0:size(contours, 1)
            if contours(c+1).id == lnbd
                B0 = contours(c);
                break;
            end
        end
        if B0.isHole
            if B.isHole
                B.parent = B0.parent;
            else
                B.parent = lnbd;
            end
        else
            if B.isHole
                B.parent = lnbd;
            else
                B.parent = B0.parent;
            end
        end
            
        i1 = -1; j1 = -1;
        i1j1 = cwNon0(F, w, h, i, j, i2, j2, 0, N_PIXEL_NEIGHBOR);
        if isnan(i1j1)
            F(i*w + j) = -nbd;
            if F(i*w + j) ~= 1
                lnbd = abs(F(i*w + j));
            end
            continue;
        end
        i1 = i1j1(1); j1 = i1j1(2);
        i2 = i1;
        j2 = j1;
        i3 = i;
        j3 = j;
        
        while true
            i4j4 = ccwNon0(F, w, h, i3, j3, i2, j2, 1, N_PIXEL_NEIGHBOR);
            i4 = i4j4(1); j4 = i4j4(2);
            
            contours(end).points(end) = Point(j4, i4);
            
            if F(i3*w +j3 +1) == 0
                F(i3*w + j3) = -nbd;
            elseif F(i3*w + j3) == 1
                F(i3*w + j3) = nbd;
            else
            end
            
            if i4 == i && j4 == j && i3 == i1 && j3 == j1
                if F(i*w + j) ~= 1
                    lnbd = abs(F(i*w + j));
                end
                break;
            else
                i2 = i3; j2 = j3; i3 = i4; j3 = j4;
            end       
        end   
        end
    end
end

