%dat=webread('https://api.telegram.org/bot883093758:AAG2WMJyUDE7Z6Oi0RGRjtRBICC9YyQaKuE/getUpdates?offset=41658107')

TOKEN = '883093758:AAG2WMJyUDE7Z6Oi0RGRjtRBICC9YyQaKuE';
[vid, videosource] = config_cam(1,3);

data=webread('https://api.telegram.org/bot883093758:AAG2WMJyUDE7Z6Oi0RGRjtRBICC9YyQaKuE/getUpdates');


while numel(data.result) == 1 
    data=webread('https://api.telegram.org/bot883093758:AAG2WMJyUDE7Z6Oi0RGRjtRBICC9YyQaKuE/getUpdates');
    pause(0.5);
end


last_update = data.result(numel(data.result)).update_id;

while true
    last_msg=webread(strcat('https://api.telegram.org/bot',TOKEN,'/getUpdates?offset=', num2str(last_update)));
    if numel(last_msg.result) == 2 
        if last_msg.result(1).message.text ==  '/capturaimagen'
           img = getsnapshot(vid);
           imshow(img);
           tgprint();
           tgprintf('Imagen capturada')
        end
        last_update = last_update +1;
    end
    
end