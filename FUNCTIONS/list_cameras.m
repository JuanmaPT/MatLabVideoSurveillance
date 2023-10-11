disp('Lista de cámaras detectadas:')
device_list=imaqhwinfo; %Muestra el nombre del adpatador de cámara
info = imaqhwinfo(device_list.InstalledAdaptors{1}); %Determine device id
device_list = info.DeviceInfo;

for i= 1:size(device_list,2)
   fprintf('%d.-       %s\n',i,device_list(i).DeviceName);
end