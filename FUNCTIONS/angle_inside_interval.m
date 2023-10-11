function [inside] = angle_inside_interval(app,vector ,angle_selector, precision)
%angle_inside_interval Devuelve 1 si el ángulo que forma el vector con el
%eje horizontal está dentro del rango [angle-precision angle+precision]
%
%       Parámetros de entrada==============================================
%
%       app             Objeto de la clase aplicación para realizar cambios
%                       sobre interfaz
%
%       vector          Vector de dos cordenadas que muestra el punto final
%                       del vector que sale desde el origen
%
%       angle_selector  Ángulo seleccionado para la comprobación de si el
%                       vector está en la misma dirección
%
%       precision       Máxima desviación permitida(tanto por ecceso como 
%                       por defecto) en grados a la hora de comparar los
%                       ángulos de vector y de angle_selector
%       ===================================================================

    real = vector(1);
    imag = vector(2);
    angle_degree = angle(real+imag*i)*180/pi;  % Conversión a dirección en grados
    
    %Casuística por periodicidad de unidad angular(de 360º se pasa a 0º)
    if angle_degree < 0
        angle_degree = 180 - angle_degree;
    end
    app.nguloLabel.Text =['Ángulo ' num2str(angle_degree)];%DEPURACIÓN
    %muestra del ángulo obtenido en interfaz.
   
    DateString = datestr(datetime('now'));
    texto = app.TextArea.Value;
    texto{end+1}=['[' DateString ']' ' Detector activado con ángulo de '  num2str(angle_degree) ' grados'];
    app.TextArea.Value = texto;
    
    
    angle_floor = angle_selector - precision;
    if angle_floor < 0
        angle_floor = angle_floor + 360;
    end
    angle_roof = angle_selector + precision;
    if angle_floor > 360
        angle_floor = angle_floor - 360;
    end
     if (angle_degree > angle_floor) && (angle_degree < angle_roof)
         inside = true;
     else
         inside = false;
     end     
      
end


                                  
