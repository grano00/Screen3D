clear all; clc; close all;

global gScreen3D
gScreen3D.I3D=1;
gScreen3D.IPD=6.4;
gScreen3D.Eyesep=NaN;
gScreen3D.Device='htcviveproeye';

fn_video = 'demoVideo.mp4';


%% Load the video
i = imread('cp.jpg');


%% Init the Screen
iscreen=max(Screen('Screens'));

iscreen=1;

Screen('Preference', 'SkipSyncTests',1);
Screen('Preference', 'ConserveVRAM', 512);

[windowPointer, rect] = Screen3D('OpenWindow',iscreen,[],[],32);

screeninfo=Screen('Resolution', windowPointer);

%% Center the image
% destinationRect(1:4)=round([1 1 rect(3)*Sizes(imovie) ScreenRes(4)*Sizes(imovie)]);
% destinationRect = CenterRect(destinationRect,rect); 
destinationRect = rect;

es = gScreen3D.Eyesep;
if(isnan(es))
    es=0;
end

destinationRect = ResizeToScreen(i,destinationRect,es);
dr = CenterRect(destinationRect,rect);   

texturePointer = Screen('MakeTexture', windowPointer, i,0,4);
Screen3D('DrawTexture', windowPointer, texturePointer,[],dr );
Screen('Close',texturePointer);
Screen('DrawingFinished', windowPointer);
vbl = Screen('Flip', windowPointer);


