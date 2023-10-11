function not_detected(app,image)
%not_detected Acciones realizadas en interfaz gr�fica cuando el
%detector NO detecta movimiento
%   Se introduce el par�metro app con el que se tiene acceso a la clase que
%   controla la interfaz gr�fica junto con la imagen con la que se va a
%   actualizar el visor del detector.
    imshow(imresize(image,app.res_show), 'Parent', app.UIAxes);
    app.DetectorarmadoLamp.Color = 'green';
    app.MOVIMIENTODETECTADOLabel.Visible = false;
end

