function [o1,o2,o3,o4,o5,o6,o7] = ScreenPass(nOutput,varargin)

    o1 = NaN;
    o2 = NaN;
    o3 = NaN;
    o4 = NaN;
    o5 = NaN;
    o6 = NaN;
    o7 = NaN;
    
    switch nOutput
        case 7
            [o1,o2,o3,o4,o5,o6,o7] = Screen(varargin{:});
        case 6
            [o1,o2,o3,o4,o5,o6] = Screen(varargin{:});
        case 5
            [o1,o2,o3,o4,o5] = Screen(varargin{:});
        case 4
            [o1,o2,o3,o4] = Screen(varargin{:});
        case 3
            [o1,o2,o3] = Screen(varargin{:});
        case 2
            [o1,o2] = Screen(varargin{:});
        case 1
            [o1] = Screen(varargin{:});
        case 0
            Screen(varargin{:});
    end

end

