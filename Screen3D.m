function [o1,o2,o3,o4,o5,o6,o7] = Screen3D(varargin)
% Set data{1} = 0 to use mono, 1 to use HMD


global gScreen3D;
if(isempty(gScreen3D))
    error(['You have to implement gScreen3D as global variable. ' ...
        'gScreen3D should be a scruct with these args: I3D,IPD,Eyesep']);
end

I3D = gScreen3D.I3D;
IPD = gScreen3D.IPD;
Eyesep = gScreen3D.Eyesep;


%Setup output args
o1 = NaN;
o2 = NaN;
o3 = NaN;
o4 = NaN;
o5 = NaN;
o6 = NaN;
o7 = NaN;


%Get ScreenTyp
screenType = varargin{1};
if(isstring(varargin{2}) || ischar(varargin{2}))
    screenType = varargin{2};
end

%% exception not yet implemented
notImplemented = 'MYFUN:NotYetImplemented';

isSBS = I3D == 2;

if(I3D == 0)
    nOutput = 7;
    if(strcmp(screenType,'OpenWindow'))
        nOutput = 2;
    elseif(strcmp(screenType,'DrawTexture') || ...
        strcmp(screenType,'FillRect') || ...
        strcmp(screenType,'DrawDots') || ...
        strcmp(screenType,'FrameRect'))
          nOutput = 0;
    end
    [o1,o2,o3,o4,o5,o6,o7] = ...
        ScreenPass(nOutput,varargin{:});
    return
else
    I3D = 1;
end

%If the screen type is passed in second position, switch the parameters
if(isnumeric(varargin{1}) && (isstring(varargin{2}) || ischar(varargin{2})))
   v = varargin{1};
   varargin{1} = varargin{2};
   varargin{2} = v;
end

%% Switch case to select params
switch screenType
    %% OPEN WINDOW
    case 'OpenWindow'
        if(I3D == 1), I3D=4; end
        varargin{7} = I3D;
        varargin{3} = WhiteIndex(varargin{2});
        [o1, o2] = Screen(varargin{:});
        e = IPD2pxSeparation(gScreen3D.Monwidth,IPD,o2(3));
        gScreen3D.Eyesep = e;
        
    %% MAKE TEXTURE
    case 'MakeTexture'
        if(isSBS)
            o1 = MakeStereoTexture(varargin{:});
        else
            o1 = ScreenPass(1,varargin{:});
        end
       
%        Screen(‘DrawLine’, windowPtr [,color], fromH, fromV, toH, toV [,penWidth]);
    
    %% DRAW LINES
    case 'DrawLines'
        
        posVar=6;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});

    %% DRAW TEXTURE    
    case 'DrawTexture'
        
        posVar = 5;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
        
    %% FILL RECT
    case 'FillRect'
               
        posVar= 4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
            
    %% FILL RECT
    case 'FillRect'
        
        posVar=4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
        
    %% DRAW DOTS
    case 'DrawDots'
        
        posVar=6;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
        
    %% DRAW ARC
    case 'DrawArc'
       
        posVar= 4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
        
    %% FRAME ARC
    case 'FrameArc'
       
        posVar= 4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
        
    %% FILL ARC
    case 'FillArc'
               
        posVar= 4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
      

    %% FRAME RECT
    case 'FrameRect'
       
        posVar= 4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
      
    %% FILL OVAL
    case 'FillOval'
               
        posVar= 4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
            
    %% FRAME OVAL
    case 'FrameOval'
       
        posVar= 4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
        
    case 'Close'
        if(iscell(varargin{2}))
            pts = varargin{2};
            varargin{2} = pts{1};
            Screen(varargin{:});
            varargin{2} = pts{2};
            Screen(varargin{:});
        else
            Screen(varargin{:});
        end
        
        
    case 'DrawLine'
       baseException = MException(notImplemented,...
            [screenType 'not implemented in screen3D -> Use DrawLines']);
       throw(baseException);
       

        
    %% NOT IMPLEMENTED
    otherwise 
        baseException = MException(notImplemented,...
            [screenType 'not implemented in Screen3D. Use Screen instead of Screen3D ']);
        throw(baseException);
end

end


