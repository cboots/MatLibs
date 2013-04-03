function [ even ] = iseven( vals )
%ISEVEN returns 1 if vals if even

even = logical(mod(vals,2) == 0);

end

