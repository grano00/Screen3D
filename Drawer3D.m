function [] = Drawer3D(wpointer, posVar, eyeSep, varargin)
%DRAWTEXTURE3D Summary of this function goes here
%   Detailed explanation goes here

try
    rect = varargin{posVar};
catch me
    if(strcmp(me.identifier,'MATLAB:badsubscript'))
        rect = Screen('Rect',wpointer);
    else
        throw(me)
    end
end


%only for draw texture
if(strcmp(varargin{1},'DrawTexture'))
   tp = varargin{3};
   if(iscell(tp))
       tpL = tp{1};
       tpR = tp{2};
   else
       tpL = tp;
       tpR = tp;
   end
end

for i = 0:1
    Screen('SelectStereoDrawBuffer', wpointer, i);
    if(i == 0) %Draw left
            rectFix = rect;
            rectFix(1) = rect(1) + eyeSep;
            if(~strcmp(varargin{1},'DrawDots'))
                rectFix(3) = rect(3) + eyeSep;
            end
            
            if(strcmp(varargin{1},'DrawTexture'))
                varargin{3} = tpL;
            end
            varargin{posVar} = rectFix;
            Screen(varargin{:});
    else %Draw right
            rectFix = rect;
            rectFix(1) = rect(1) - eyeSep;           
            if(~strcmp(varargin{1},'DrawDots'))
                rectFix(3) = rect(3) - eyeSep;
            end
            
            if(strcmp(varargin{1},'DrawTexture'))
                varargin{3} = tpR;
            end
            varargin{posVar} = rectFix;
            Screen(varargin{:});
    end
end
end

