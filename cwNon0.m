function counter = cwNon0(F, w, ~, i0, j0, i, j, offset, N_PIXEL_NEIGHBOR)
    counter = NaN;
    ID = neighborIndexToID(i0, j0, i, j);
    for k = 1:N_PIXEL_NEIGHBOR
        kk = mod(k + ID - offset + N_PIXEL_NEIGHBOR*2, N_PIXEL_NEIGHBOR);
        ij = neighborIDToIndex(i0, j0, kk);
        if F(ij(1)*w + ij(2)) ~= 0
            counter = ij;
        end
    end
end