clear all; clc; close all;

fn_video = 'demoVideo.mp4';
stereoMode = 1;
IPD = 6.4;

%% Load the video
v = VideoReader(fn_video);


%% Init the Screen
iscreen=max(Screen('Screens'));

Screen('Preference', 'SkipSyncTests',1);
Screen('Preference', 'ConserveVRAM', 512);

[windowPointer, rect, eyeSep] = Screen3D({'htcviveproeye',stereoMode,IPD},...
    'OpenWindow',iscreen,[],[],32);

screeninfo=Screen('Resolution', windowPointer);

%% Center the image
% destinationRect(1:4)=round([1 1 rect(3)*Sizes(imovie) ScreenRes(4)*Sizes(imovie)]);
% destinationRect = CenterRect(destinationRect,rect); 
destinationRect = rect;


fixcoord=[500, 500, 550, 550];


%% Reproduce the Video
for i=1:5000
    frame = v.read(i);
    texturePointer = Screen('MakeTexture', windowPointer, frame,0,4);
    Screen3D({1,eyeSep},'DrawTexture', windowPointer, texturePointer,[],destinationRect );
    Screen3D({1,eyeSep}, 'FillRect', windowPointer,uint8([255 0 0]), fixcoord);
    Screen3D({1,eyeSep}, 'DrawDots', windowPointer, [20, 50], ...
        [50], uint8([0 255 0]), [700,600],1);
    Screen3D({1,eyeSep},'FrameRect', windowPointer, uint8([255 0 0]), destinationRect/2,3);
    
    Screen('Close',texturePointer);
    Screen('DrawingFinished', windowPointer);
    vbl = Screen('Flip', windowPointer);
end

Screen('CloseAll');
