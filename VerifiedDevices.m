function [dev] = VerifiedDevices(name)
%VERIFIEDDEVICES it will return the list of supported device
%   use 'GetAll' to return a cell array of all the devices

%%Not yet implemented, actually return only HTC Vive Pro
warning('Not yet implemented, actually return only HTC Vive Pro Eye');

dev.id= 'htcviveproeye';
dev.name= 'HTC Vive PRO Eye';
dev.displayWith_cm= 15.5;
dev.displayDiag_inch= 7;
dev.displayRes=[2880,1600]; 





end

