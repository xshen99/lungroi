function results = searchROI(patients, disease)
    index = 1;
    results = [];
    for i = 1:size(patients, 2)
        ROIs = patients(i).ROIs;
        for j = 1:size(ROIs, 2)
            if (strcmp(ROIs(j).label,disease))
                results(index).patientNum = i;
                results(index).ROINum = j;
                index = index + 1;
            end
        end        
    end   
end

%                           Example
%   label           Total   patientNum  ROINum
%   healthy         100     27          1
%   emphysema       66      40          36
%   ground_glass    393     2           35
%   fibrosis        377     1           1
%   micronodules    297     13          1