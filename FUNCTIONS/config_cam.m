function [vidobj, videosource] = config_cam(selected_camera,quality, color_space)
%CONFIG_CAM Configura e inicia la captura de una cámara a la calidad
%seleccionada.
%   El valor de quality modifica la resolución con la que el sistema va a
%   trabajar. 
%__________________________________________________________________________
%Los valores válidos de quality son:
%       1  Calidad baja    320x240  pixeles
%       2  Calidad media   640x480  pixeles
%       3  Calidad alta    1280x720 pixeles
%__________________________________________________________________________
%Los valores válidos de color_space son:
%       - 'grayscale'
%       - 'rgb'
%       - 'YCbCr'
%       - 'bayer'
%__________________________________________________________________________

    device_list=imaqhwinfo; %Muestra el nombre del adpatador de cámara
    info = imaqhwinfo(device_list.InstalledAdaptors{1}); %Determine device id
    if numel(info.DeviceInfo) == 0
        disp('ERROR - No device connected to the fist video adpator')
        return
    end
    formats_list= info.DeviceInfo(selected_camera).SupportedFormats;
    
    
    %Se obtiene la lista de formatos disponibles para la cámara
    %seleccionada y se busca en esta lista de formatos la resolución
    %asignadaa cada na de las 3 calidades disponibles.
    if strcmp(quality,'low')
        IndexC = strfind(formats_list,'320x240');
        Index = find(not(cellfun('isempty',IndexC)),1);
    else if strcmp(quality,'medium')
            IndexC = strfind(formats_list,'640x480');
            Index = find(not(cellfun('isempty',IndexC)),1);
        else if strcmp(quality,'high')
                IndexC = strfind(formats_list,'1280x720');
                Index = find(not(cellfun('isempty',IndexC)),1);
            else
                disp('ERROR - Llamada a config camera con un argumento inválido');
                return;
            end
        end
    end
    device_list=imaqhwinfo; %Muestra el nombre del adpatador de cámara
    info = imaqhwinfo(device_list.InstalledAdaptors{1}); %Determine device id
    device.AdaptorName = info.AdaptorName;
    device.ID = info.DeviceIDs{selected_camera}(1);
    dev_info = imaqhwinfo(device.AdaptorName,device.ID);
    device.SupportedFormats=dev_info.SupportedFormats;
    %Creating the Video Input Object
    vidobj = videoinput(device.AdaptorName,device.ID,dev_info.SupportedFormats{Index});
    %Select the source to use for acquisition(in webcam case, only one input)
    vidobj.SelectedSourceName = 'input1';
    vidobj.ReturnedColorSpace = color_space;%Or Graycale Or bayer....
    %View the properties for the selected video source object.
    videosource = getselectedsource(vidobj);
    
    % Configure the object for manual trigger mode.
    triggerconfig(vidobj, 'manual');
    
    % Now that the device is configured for manual triggering, call START.
    % This will cause the device to send data back to MATLAB, but will not log
    % frames to memory at this point.
%     start(vidobj)
end

