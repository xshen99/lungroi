function [region] = getImg(patients, patientNum, ROINum)
    windowSize = 3072;
    patches = [];
    
    % find the .dcm file
    ROI = patients(patientNum).ROIs(ROINum);
    x = int2str(ROI.slice_number);
    str = strcat(patients(patientNum).dir, '/*0',x,'.dcm');
    dicom = dir(str);
    img = dicomread(strcat(patients(patientNum).dir, '/', dicom.name));
    
    
    % find the region
    labelX = round(ROI.xValues / ROI.spacing_x);
    xMin = min(labelX);
    xMax = max(labelX);
    labelY = round(ROI.yValues / ROI.spacing_y);
    yMin = min(labelY);
    yMax = max(labelY);

    region = img(yMin:yMax, xMin:xMax);
    region = three_windows(region);
end

