clear all; clc; close all;

global gScreen3D
gScreen3D.I3D=1;
gScreen3D.IPD=6.4;
gScreen3D.Eyesep=NaN;
gScreen3D.Monwidth=15.5; % horizontal display width (cm)
gScreen3D.Vdist=2.5; % viewing distance  (cm)



%% Load the video
img = imread('R.jfif');


%% Init the Screen
iscreen=max(Screen('Screens'));


Screen('Preference', 'SkipSyncTests',1);
Screen('Preference', 'ConserveVRAM', 512);

[windowPointer, rect] = Screen3D('OpenWindow',iscreen,[],[],32);

gScreen3D.Eyesep = gScreen3D.Eyesep*1;

screeninfo=Screen('Resolution', windowPointer);

%% Center the image
% destinationRect(1:4)=round([1 1 rect(3)*Sizes(imovie) ScreenRes(4)*Sizes(imovie)]);
% destinationRect = CenterRect(destinationRect,rect); 
destinationRect = rect;


%posizionare prima di DrawTexture
%argomenti img = immagine
destinationRect = ResizeToScreen(img,destinationRect);
dr = CenterRect(destinationRect,rect);   

texturePointer = Screen3D('MakeTexture', windowPointer, img,0,4);
Screen3D('DrawTexture', windowPointer, texturePointer,[],dr );
Screen3D('Close',texturePointer);
Screen('DrawingFinished', windowPointer);
vbl = Screen('Flip', windowPointer);


