classdef Contour
    %CONTOUR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        %dinh
        points
        %unique id, start from 2
        id
        %id of parent contour, 0 = top-level contour
        parent
        %is this contour a hole
        isHole
    end
    methods
        function obj = set.points(obj, value)
            obj.points = value;
        end
        function obj = set.id(obj, value)
            obj.id = value;
        end
        function obj = set.parent(obj, value)
            obj.parent = value;
        end
        function obj = set.isHole(obj, value)
            obj.isHole = value;
        end
        function obj = setPoints(value)
            obj.points = value;
        end
        function obj = setID(value)
            obj.id = value;
        end
        function obj = setParent(value)
            obj.parent = value;
        end
        function obj = setIsHole(value)
            obj.isHole = value;
        end
    end
end

