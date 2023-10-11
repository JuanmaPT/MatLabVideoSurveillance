DateString = datestr(datetime('now'));
[status,msg] = mkdir('ALERTAS',replace(DateString,':','-'));
for i=1:30
    img= getsnapshot(vid);
    baseFileName = sprintf('Image #%d.png', i);
    fullFileName = fullfile(strcat('ALERTAS/',replace(DateString,':','-')), baseFileName);
    imwrite(img, fullFileName);
end