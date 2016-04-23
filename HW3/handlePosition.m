function ang = handlePosition( yval )
%% Description
% Author: Chi-Lun Lin
% Date: 03/31/2016
% Input:
% yval: the input knife position
% Output:
% ang:the vertical input handle position
%     (in degrees, referenced from the positive x-axis)
%=============================================================
%% 
% You need to declaire these global variables in your m-files so that they
% can be shared between functions.
global link2 link3 offset

% distance from the knife point to the pivot (see Fig. 2 in the MA calculation document)
d_knife2pivot = sqrt(offset^2 + yval^2);
% beta & alpha angles are defined to calculate the link2 angle 
% (see attached figure)
beta = asin( yval/d_knife2pivot );
alpha = acos( (link2^2+d_knife2pivot^2-link3^2)/(2*link2*d_knife2pivot) );
ang = alpha-beta;
ang = (pi-ang)*180/pi; %reference x-axis, in degrees

end

    