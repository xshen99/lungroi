function patients = getPatients()
dirname = '~/Documents/cv/pj/ILD_Data/ILD_DB_txtROIs';
fileList = dir(strcat(dirname, '/*/*.txt'));
for i = 1:size(fileList)
    path = strcat(fileList(i).folder, '/', fileList(i).name);
    ROIs = loadROIfiles(path);
    patients(i).dir = fileList(i).folder;
    patients(i).ROIs = ROIs;
end

end

% save path:
% save('~/Documents/code/deep learning/lungroi/data/matlab/patients.mat','patients');