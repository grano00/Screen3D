function [] = Drawer3D(wpointer, posVar, eyeSep, varargin)
%DRAWTEXTURE3D Summary of this function goes here
%   Detailed explanation goes here
rect = varargin{posVar};
for i = 0:1
    Screen('SelectStereoDrawBuffer', wpointer, i);
    if(i == 0) %Draw left
            rectFix = rect;
            rectFix(1) = rect(1) + eyeSep;
            if(~strcmp(varargin{1},'DrawDots'))
                rectFix(3) = rect(3) + eyeSep;
            end
            varargin{posVar} = rectFix;
            Screen(varargin{:});
    else %Draw right
            rectFix = rect;
            rectFix(1) = rect(1) - eyeSep;           
            if(~strcmp(varargin{1},'DrawDots'))
                rectFix(3) = rect(3) - eyeSep;
            end
            varargin{posVar} = rectFix;
            Screen(varargin{:});
    end
end
end

