function ID = neighborIndexToID(i0, j0, i, j)
    di = i - i0;
    dj = j - j0;
    ID = 0;
    if di == 0 && dj == 1
        ID = 0;
    end
    if di == -1 && dj == 1
        ID = 1;
    end
    if di == -1 && dj == 0
        ID = 2;
    end
    if di == -1 && dj == -1
        ID = 3;
    end
    if di == 0 && dj == -1
        ID = 4;
    end
    if di == 1 && dj == -1
        ID = 5;
    end
    if di == 1 && dj == 0
        ID = 6;
    end
    if di == 1 && dj == 1
        ID = 7;
    end
end

