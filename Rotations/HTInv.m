function [ HTinv ] = HTInv( HT )
%HTINVERSE Summary of this function goes here
%   Detailed explanation goes here
HTinv = [HT(1:3,1:3)' -HT(1:3,4); 0 0 0 1];

end

