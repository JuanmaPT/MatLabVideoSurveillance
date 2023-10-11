function [devNameList] = device_name_list(adaptor)
%DeviceNameList Returns a list with the found cameras for the adaptor.
%   The function uses the imaqhwinfo function and extracs the information
%   of the device's names.
        device_list=imaqhwinfo; %Adapter name
        info = imaqhwinfo(device_list.InstalledAdaptors{adaptor}); %Determine device id
        device_list = info.DeviceInfo;
        devNameList = strings(1,numel(device_list));
        for i=1:numel(device_list)
            devNameList(i) = device_list(i).DeviceName;
        end
end
