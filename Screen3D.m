function [o1,o2,o3,o4] = Screen3D(data,varargin)
% IPD contains the user IPD 
% (not yet implemented) Set IPD to 0 to use modo, 1 to use HMD

%It is acqually used for 
%'OpenWindows', 
%   #INPUT#
%   data structure 
%       {
%           deviceName: write the dev name as string, to get the list of
%           devices ids use VerifiedDevices('GetAll')
%           stereoMode: 0 mono, 1 second display, 2 vr (actually, works 
%                       only second display 
%           IPD: IPD in cm
%       }
%
%   #OUTPUT
%   it returns (3) WindowPointer, Rect, EyeSep
%   
%   #EXAMPLE
%   [windPtr,rect,eyeSep] = Screen3D({'htcviveproeye',1,6.4}, ...
%               'OpenWindow',iscreen,[],[],32);



%Setup output args
o1 = NaN;
o2 = NaN;
o3 = NaN;
o4 = NaN;


%% exception not yet implemented
notImplemented = 'MYFUN:NotYetImplemented';

%% Switch case to select params
switch varargin{1}
    %% OPEN WINDOW
    case 'OpenWindow'
        stereoMode=data{1};
        IPD=data{2};
        if(stereoMode == 1), stereoMode=4; end;
        varargin{7} = stereoMode;
        varargin{3} = WhiteIndex(varargin{2});
        [o1, o2] = Screen(varargin{:});
        o3 = IPD2pxSeparation('htcviveproeye',IPD,o2(3))
        
    %% MAKE TEXTURE
    case 'MakeTexture'
        disp('mt')
        
    %% NOT IMPLEMENTED
    otherwise 
        baseException = MException(notImplemented,...
            'Use Screen instead of Screen3D ');
        throw(baseException);
end

end


% [windowPtr,rect]=Screen(�OpenWindow�,windowPtrOrScreenNumber [,color] [,rect] [,pixelSize] [,numberOfBuffers] [,stereomode] [,multisample][,imagingmode][,specialFlags][,clientRect][,fbOverrideRect][,vrrParams=[]]);
% [windowPtr,rect]=Screen(�OpenOffscreenWindow�,windowPtrOrScreenNumber [,color] [,rect] [,pixelSize] [,specialFlags] [,multiSample]);
% textureIndex=Screen(�MakeTexture�, WindowIndex, imageMatrix [, optimizeForDrawAngle=0] [, specialFlags=0] [, floatprecision] [, textureOrientation=0] [, textureShader=0]);
% oldParams = Screen(�PanelFitter�, windowPtr [, newParams]);
% Screen(�Close�, [windowOrTextureIndex or list of textureIndices/offscreenWindowIndices]);
% Screen(�CloseAll�);
% currentbuffer = Screen(�SelectStereoDrawBuffer�, windowPtr [, bufferid] [, param1]);
% Screen(�DrawLine�, windowPtr [,color], fromH, fromV, toH, toV [,penWidth]);
% Screen(�DrawArc�,windowPtr,[color],[rect],startAngle,arcAngle)
% Screen(�FrameArc�,windowPtr,[color],[rect],startAngle,arcAngle[,penWidth] [,penHeight] [,penMode])
% Screen(�FillArc�,windowPtr,[color],[rect],startAngle,arcAngle)
% Screen(�FillRect�, windowPtr [,color] [,rect] );
% Screen(�FrameRect�, windowPtr [,color] [,rect] [,penWidth]);
% Screen(�FillOval�, windowPtr [,color] [,rect] [,perfectUpToMaxDiameter]);
% Screen(�FrameOval�, windowPtr [,color] [,rect] [,penWidth] [,penHeight] [,penMode]);
% Screen(�FramePoly�, windowPtr [,color], pointList [,penWidth]);
% Screen(�FillPoly�, windowPtr [,color], pointList [, isConvex]);