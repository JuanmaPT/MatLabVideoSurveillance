function save_configuration(app)
%save_configuration Guarda la configuración de la aplicación que se ha
%seleccionado para su uso en la siguiente ejecución de la aplicación.
%   La función se nutre de la posibilidad de guardar y cagra variables
%   de MAtlab mediante la función save. Usanto esta función se almacena la
%   matriz de sensibilidades y los botones y parámetros configurados por el
%   usuario.
    p1 = app.EstablecerhorarioCheckBox.Value;
    p2 = app.FiltartamaodeobjetoCheckBox.Value;
    p3 = app.FiltrardireccinCheckBox.Value;
    p4 = app.AngleSpinner.Value;
    p5 = app.EstablecerhorarioCheckBox.Value;
    p6 = app.HorainicioEditField.Value;
    p7 = app.HorafinalEditField.Value;
    p8 = app.SensibilidadKnob.Value;
    p9 = app.Spinner.Value;
    p10 = app.BajaButton.Value;
    p11 = app.MediaButton.Value;
    p12 = app.AltaButton.Value;
    save('configuration.mat','p1','p2','p3','p4','p5','p6','p7','p8',...
        'p9','p10','p11','p12');
end

