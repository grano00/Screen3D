function [eyeSepPx] = IPD2pxSeparation(displayWidth,IPD,dimPx)
%IPD2PXSEPARATION this function return the number of pixel that should be
%shifted (in both eyes images) to center monoscopic images with the eye

%   device:  can be numeric or string. If it is numeric, it should be 
%           width (in cm) of the screen. Otherwise, you can use the device
%           id (e.g., htcvivepro) if it is in the supported list
%   IPD: IPD of the user
%   dimPx: half screen width resolution (which corresponts to one eye screen)




eyeIDP = IPD/2; %One side IPD
eyeDisp = displayWidth/2; %size of a display for a single eye

centerDisp = eyeDisp/2; %Center of Eye Display
distance = abs(centerDisp-eyeIDP); %distance between center of display and center eye
eyeSepPx = round(distance/eyeDisp*dimPx); %convert in px

end

