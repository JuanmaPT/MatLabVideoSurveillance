function load_configuration(app)
%load_configuration Carga las selecciones realizadas en la anterior
%ejecución del programa utilizando la función load para leer las variables
%almacenadas en el fichero "configuration.mat" .
    try
        load("configuration.mat");
        app.EstablecerhorarioCheckBox.Value =p1;
        app.TamaodeobjetoCheckBox.Value =p2;
        app.FiltrardireccinCheckBox.Value =p3;
%       app.Knob.Value =p4 ;
        app.EstablecerhorarioCheckBox.Value =p5 ;
        app.HorainicioEditField.Value =p6 ;
        app.HorafinalEditField.Value =p7 ;
        app.SensibilidadKnob.Value =p8 ;
        app.Spinner.Value  =p9;
        app.BajaButton.Value =p10  ;
        app.MediaButton.Value =p11  ;
        app.AltaButton.Value =p12 ;
        app.Spinner.Value = p9;
    catch ME
        disp('FIchero de configuración inexistente o corrupto')
    end     
end

