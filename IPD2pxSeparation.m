function [eyeSepPx] = IPD2pxSeparation(device,IPD,dimPx)
%IPD2PXSEPARATION this function return the number of pixel that should be
%shifted (in both eyes images) to center monoscopic images with the eye

%   device:  can be numeric or string. If it is numeric, it should be 
%           width (in cm) of the screen. Otherwise, you can use the device
%           id (e.g., htcvivepro) if it is in the supported list
%   IPD: IPD of the user
%   dimPx: half screen width resolution (which corresponts to one eye screen)

displayWith=0; % with of vr display (in cm).  It is used only if I3D is equal to 1

if(isnumeric(device))
    displayWith=device;
else
    dev = VerifiedDevices(device);
    displayWith = dev.displayWith_cm;
    if(nargin<3)
        dimPx = dev.displayRes/2;
    end
end



eyeIDP = IPD/2; %One side IPD
eyeDisp = displayWith/2; %size of a display for a single eye

centerDisp = eyeDisp/2; %Center of Eye Display
distance = abs(centerDisp-eyeIDP); %distance between center of display and center eye
eyeSepPx = round(distance/eyeDisp*dimPx); %convert in px
end

