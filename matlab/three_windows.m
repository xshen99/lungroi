function Iout = three_windows(image)
%mat2gray
% standard
%ct_windows = [-160,240; ... % liver (MITK preset)
%    -1400, 200; ...         % lung (MITK preset)
%    -1400, -950];           % emphysema (MITK preset)

% LTRC
 ct_windows = [840,1240;    % liver (MITK preset)
     0, 1200;               % lung (MITK preset)
     0, 450];               % emphysema (MITK preset)

NW = size(ct_windows,1);


Iout = [];
for w = 1:NW
    I = image; % reset to original HU
    winMin = ct_windows(w,1);
    winMax = ct_windows(w,2);
    I(I<=winMin) = winMin;
    I(I>=winMax) = winMax;
    Iout(:,:,w) = rescale(I,0,255,'InputMin',winMin,'InputMax',winMax);
    %Iout(:,:,w) = uint8(imresize(rescale(I,0,255), [224,224]));
end
Iout = uint8(Iout);
% 
% 
% image = normalize(image);