function index = neighborIDToIndex(i, j, id)
    switch id
        case 0
            index = [i j+1];
        case 1
            index = [i-1 j+1];
        case 2
            index = [i-1 j];
        case 3
            index = [i-1 j-1];
        case 4
            index = [i j-1];
        case 5
            index = [i+1 j-1];
        case 6
            index = [i+1 j];
        case 7
            index = [i+1 j+1];
        otherwise
            index = NaN;
    end
end

