function [ dtstr ] = datetimestring()
%TIMESTAMPSTR Gets the current datetime as a string that could be used as 
%a file name. (Format: yyyymmddTHHMMSS (ISO 8601)) Hours in zulu time. Uses
%current unix time.

dtstr = datestr(clock,30);

end

