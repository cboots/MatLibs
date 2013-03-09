function [ bounded ] = range_limit( unbounded, minval, maxval )
%RANGE_LIMIT Summary of this function goes here
%   Detailed explanation goes here
    bounded = max(minval, min(unbounded, maxval));
    
end

