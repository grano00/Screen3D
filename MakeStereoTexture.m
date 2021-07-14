function [idxTexs] = MakeStereoTexture(varargin)
%MAKESTEREOTEXTURE Summary of this function goes here
%   Detailed explanation goes here

frame = varargin{3};

switch ndims(frame)
    case 3
        f1 = frame(:,1:end/2,:);
        f2 = frame(:,end/2:end,:);
    case 2
        f1 = frame(:,1:end/2);
        f2 = frame(:,end/2:end);
end

v = varargin;
v{3} = f1;
o1 = Screen(v{:});
v{3} = f2;
o2 = Screen(v{:});
idxTexs = {o1,o2};

end

