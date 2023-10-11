[vidobj, videosource] = config_cam(1,'high','RGB');

frameRates = set(videosource, 'FrameRate')
% Set the frame rate to 60 fps
fps = frameRates{1};
videosource.FrameRate = fps;
vidobj.TimeOut = Inf;
vidobj.TriggerRepeat = Inf;
vidobj.FrameGrabInterval = 1;
vidobj.FramesPerTrigger = 1;
vidobj.LoggingMode = 'disk';
%%Create the VideoWriter object and set the DiskLogger Property
timenow = datestr(now,'hhMMss_ddmmyy');
v = VideoWriter(['video_', timenow,'.avi']);
v.Quality = 100;
v.FrameRate = str2double(fps);
video.DiskLogger = v;

capturetime = 10;
interval = get(vid,'FrameGrabInterval');
numframes = floor(capturetime * framerate / interval)

avi = avifile('timelapsevideo','fps',fps);
set(vid,'DiskLogger',avi);

start(vidobj)
pause(5)                                
stop(vidobj)