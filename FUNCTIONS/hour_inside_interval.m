function [result] = hour_inside_interval(h_start,h_end)
%Hour Inside Interval Returns 1 if the current time is between the values
%specified in the hour interval h_start and h_end, returns 0 in other case.
%   The time format for the time is "hh:mm" 
    actual = clock;
    start_date = actual;
    end_date = actual;
    start_hour = [str2num(h_start(1:2)) str2num(h_start(4:5))];
    end_hour = [str2num(h_end(1:2)) str2num(h_end(4:5))];
    
    if start_hour(1) < end_hour(1)
        start_date(4:5) = start_hour;
        end_date(4:5) = end_hour;
        if (datetime(start_date) < datetime(actual)) && (datetime(end_date) > datetime(actual))
            result = 1;
        else
            result = 0;
        end
    else
        start_date(4:5) = start_hour;
        end_date(4:5) = end_hour;
        end_date(3) = end_date(3) + 1;
        if datetime(start_date) < datetime(actual) && datetime(end_date) > datetime(actual)
            result = 1;
        else
            result = 0;
        end
    end
    
end

