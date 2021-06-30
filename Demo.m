clear all; clc; close all;

fn_video = 'demoVideo.mp4';

%% Load the video
v = VideoReader(fn_video);


%% Init the Screen
Screen('Preference', 'SkipSyncTests',1);
Screen('Preference', 'ConserveVRAM', 512);

[windowPointer, rect, eyeSep] = Screen3D({'htcviveproeye',stereoMode,IPD},...
    'OpenWindow',iscreen,[],Window,32);

screeninfo=Screen('Resolution', windowPointer);
Screen('TextSize', windowPointer,20);
Screen('FillRect', windowPointer, 0);

%% Reproduce the Video
for i=1:v.Num
texturePointer = Screen('MakeTexture', windowPointer, M.frames(iframe).cdata,0,4);
for i = 0:i3D
    Screen('SelectStereoDrawBuffer', windowPointer, i);
    if(i == 0) %Draw left
        if(I3D == 1) %if second display
            destinationRect2 = destinationRect;
            destinationRect2(1) = destinationRect(1) + eyeSep;
            destinationRect2(3) = destinationRect(3) + eyeSep;
            Screen('DrawTexture', windowPointer, texturePointer,[],destinationRect2 );
        else
            Screen('DrawTexture', windowPointer, texturePointer,[],destinationRect );
            %Screen('FillRect', windowPointer,revCol,myRect);
        end

        %vblA = Screen('Flip', windowPointer);
    else %Draw right
        if(I3D == 1) %if second display
            destinationRect2 = destinationRect;
            destinationRect2(1) = destinationRect(1) - eyeSep;
            destinationRect2(3) = destinationRect(3) - eyeSep;
            Screen('DrawTexture', windowPointer, texturePointer,[],destinationRect2 );
        else
            Screen('DrawTexture', windowPointer, texturePointer,[],destinationRect );
            %Screen('FillRect', windowPointer,revCol,myRect);
        end

        %vblB = Screen('Flip', windowPointer);
    end

end


Screen('Close',texturePointer);
Screen('DrawingFinished', windowPointer);

