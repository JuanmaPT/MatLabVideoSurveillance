function [inside] = angle_inside_interval(app,vector ,angle_selector, precision)
%angle_inside_interval Devuelve 1 si el �ngulo que forma el vector con el
%eje horizontal est� dentro del rango [angle-precision angle+precision]
%
%       Par�metros de entrada==============================================
%
%       app             Objeto de la clase aplicaci�n para realizar cambios
%                       sobre interfaz
%
%       vector          Vector de dos cordenadas que muestra el punto final
%                       del vector que sale desde el origen
%
%       angle_selector  �ngulo seleccionado para la comprobaci�n de si el
%                       vector est� en la misma direcci�n
%
%       precision       M�xima desviaci�n permitida(tanto por ecceso como 
%                       por defecto) en grados a la hora de comparar los
%                       �ngulos de vector y de angle_selector
%       ===================================================================

    real = vector(1);
    imag = vector(2);
    angle_degree = angle(real+imag*i)*180/pi;  % Conversi�n a direcci�n en grados
    
    %Casu�stica por periodicidad de unidad angular(de 360� se pasa a 0�)
    if angle_degree < 0
        angle_degree = 180 - angle_degree;
    end
    app.nguloLabel.Text =['�ngulo ' num2str(angle_degree)];%DEPURACI�N
    %muestra del �ngulo obtenido en interfaz.
   
    DateString = datestr(datetime('now'));
    texto = app.TextArea.Value;
    texto{end+1}=['[' DateString ']' ' Detector activado con �ngulo de '  num2str(angle_degree) ' grados'];
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


                                  
