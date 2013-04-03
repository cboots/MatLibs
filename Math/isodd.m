function [ odd ] = isodd( vals )
%ISEVEN returns 1 if vals if even

odd = logical(mod(vals,2) == 1);

end

