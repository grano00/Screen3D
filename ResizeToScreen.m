function [dr] = ResizeToScreen(frame,dr,eyeSep)
%RESIZETOSCREEN Summary of this function goes here
%   Detailed explanation goes here
if(nargin<3)
   eyeSep = 0; 
end

[r,c] = size(frame);
if(r > (dr(4)-dr(2)))
    frame = imresize(frame, [dr(4), NaN]);
    [r,c,~] = size(frame);
    dr(3:4) = [c,r];
end
if(c > (dr(3)-dr(1)))
    dr(3) = dr(3) - eyeSep;
    frame = imresize(frame, [NaN, dr(3)]);
    [r,c,~] = size(frame);
    dr(3:4) = [c,r];
end
 
end

