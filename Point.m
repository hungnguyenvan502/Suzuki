classdef Point
    %POINT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x 
        y 
    end
    
    methods
        function obj = Point(x1,y1)
            %POINT Construct an instance of this class
            %   Detailed explanation goes here
            obj.x = x1;
            obj.y = y1;
        end
        function obj = set.x(obj, value)
            obj.x = value;
        end
        function obj = set.y(obj, value)
            obj.y = value;
        end
        function obj = setX(value)
            obj.x = value;
        end
        function obj = setY(value)
            obj.y = value;
        end
    end
end

