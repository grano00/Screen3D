function [o1,o2,o3,o4,o5,o6,o7] = Screen3D(varargin)
% Set data{1} =0 to use mono, 1 to use HMD

%It is acqually used for 
%'OpenWindows', 
%'DrawTexture', 
%'FillRect', 
%'DrawDots', 
% 'FrameRect'


global gScreen3D;
if(isempty(debugFlag))
    error(['You have to implement gScreen3D as global variable. ' ...
        'gScreen3D should be a scruct with these args: I3D,IPD,Eyesep,device']);
end
I3D = gScreen3D.I3D;
IPD = gScreen3D.IPD;
Eyesep = gScreen3D.Eyesep;
device = gScreen3D.Device;


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
        if(I3D == 1), I3D=4; end;
        varargin{7} = I3D;
        varargin{3} = WhiteIndex(varargin{2});
        [o1, o2] = Screen(varargin{:});
        e = IPD2pxSeparation(device,IPD,o2(3));
        disp(['eyesepin3d:',num2str(e)]);
        gScreen3D.Eyesep = e;
        disp(['gScreen3D:',num2str(gScreen3D.Eyesep)]);
        
    %% MAKE TEXTURE
    case 'MakeTexture'
        disp('mt')
        
    case 'DrawTexture'
        
        posVar = 5;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
        
    %% FILL RECT
    case 'FillRect'
        
        posVar=4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
        
    %% DRAW DOTS
    case 'DrawDots'
        
        posVar=6;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
    
    %% FRAME RECT
    case 'FrameRect'
       
        posVar= 4;
        Drawer3D(varargin{2},posVar,Eyesep,varargin{:});
        
    %% NOT IMPLEMENTED
    otherwise 
        baseException = MException(notImplemented,...
            'Use Screen instead of Screen3D ');
        throw(baseException);
end

end


% [windowPtr,rect]=Screen(‘OpenWindow‘,windowPtrOrScreenNumber [,color] [,rect] [,pixelSize] [,numberOfBuffers] [,stereomode] [,multisample][,imagingmode][,specialFlags][,clientRect][,fbOverrideRect][,vrrParams=[]]);
% [windowPtr,rect]=Screen(‘OpenOffscreenWindow‘,windowPtrOrScreenNumber [,color] [,rect] [,pixelSize] [,specialFlags] [,multiSample]);
% textureIndex=Screen(‘MakeTexture’, WindowIndex, imageMatrix [, optimizeForDrawAngle=0] [, specialFlags=0] [, floatprecision] [, textureOrientation=0] [, textureShader=0]);
% oldParams = Screen(‘PanelFitter’, windowPtr [, newParams]);
% Screen(‘Close’, [windowOrTextureIndex or list of textureIndices/offscreenWindowIndices]);
% Screen(‘CloseAll’);
% currentbuffer = Screen(‘SelectStereoDrawBuffer’, windowPtr [, bufferid] [, param1]);
% Screen(‘DrawLine’, windowPtr [,color], fromH, fromV, toH, toV [,penWidth]);
% Screen(‘DrawArc‘,windowPtr,[color],[rect],startAngle,arcAngle)
% Screen(‘FrameArc‘,windowPtr,[color],[rect],startAngle,arcAngle[,penWidth] [,penHeight] [,penMode])
% Screen(‘FillArc‘,windowPtr,[color],[rect],startAngle,arcAngle)
% Screen(‘FillRect’, windowPtr [,color] [,rect] );
% Screen(‘FrameRect’, windowPtr [,color] [,rect] [,penWidth]);
% Screen(‘FillOval’, windowPtr [,color] [,rect] [,perfectUpToMaxDiameter]);
% Screen(‘FrameOval’, windowPtr [,color] [,rect] [,penWidth] [,penHeight] [,penMode]);
% Screen(‘FramePoly’, windowPtr [,color], pointList [,penWidth]);
% Screen(‘FillPoly’, windowPtr [,color], pointList [, isConvex]);
