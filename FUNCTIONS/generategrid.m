function [grid] = generategrid(resolution, blocksize, sensibility, pattern)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if (mod(resolution(2),blocksize)~= 0 || mod(resolution(1),blocksize)~= 0) 
        disp('ERROR - Tamaño de bloque no consistente')
        return
    else
        if pattern == 'complete'
            grid=[ones(resolution(1)/blocksize,resolution(2)/blocksize)*sensibility];
        end    
    end
end

