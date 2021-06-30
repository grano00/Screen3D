function [] = Drawer3D(wpointer, rectPosVar, eyeSep, varargin)
%DRAWTEXTURE3D Summary of this function goes here
%   Detailed explanation goes here
rect = varargin{rectPosVar};
for i = 0:1
    Screen('SelectStereoDrawBuffer', wpointer, i);
    if(i == 0) %Draw left
            rectFix = rect;
            rectFix(1) = rect(1) + eyeSep;
            rectFix(3) = rect(3) + eyeSep;
            varargin{rectPosVar} = rectFix;
            Screen(varargin{:});
    else %Draw right
            rectFix = rect;
            rectFix(1) = rect(1) - eyeSep;
            rectFix(3) = rect(3) - eyeSep;
            varargin{rectPosVar} = rectFix;
            Screen(varargin{:});
    end
end
end

