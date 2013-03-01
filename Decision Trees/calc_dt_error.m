%Takes a trained decision tree as input and a set of test data X Y,
%returning the error rate.
function [error] = calc_dt_error(dt, X, Y)

error = 0;
for i=1:size(X,1)
    [p y] = max(dt_value(dt, X(i,:)));%classify this point
    error = error + (y ~= Y(i));
end

error = error/size(X,1);%Normalize
