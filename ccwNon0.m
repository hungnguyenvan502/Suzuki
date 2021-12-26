function counter = ccwNon0(F, w, ~, i0, j0, i, j, offset, N_PIXEL_NEIGHBOR)
    counter = NaN;
    ID = neighborIndexToID(i0, j0, i, j);
    for k = 0:N_PIXEL_NEIGHBOR -1
        kk = mod(-k + ID - offset + N_PIXEL_NEIGHBOR*2, N_PIXEL_NEIGHBOR);
        ij = neighborIDToIndex(i0, j0, kk);
        if F(ij(0)*w + ij(1)) ~= 0
            counter = ij;
        end
    end
end

