function M = confusion(actual, predicted, k)
%Usage
%   M = confusion(actual, predicted, k)
%
%   Actual and predicted are vectors of same length indicating ground truth
%   and model predictions respectively.
%
%   k is the number of classes. If not supplied, it will default to the
%   highest class label in actual or predicted
%   
%   M is returned unnormalized to be more flexible to end use.

if(nargin < 3)
    k = max([actual predicted]);
end

M = zeros(k);

for i = 1:numel(actual)
    x = actual(i);
    y = predicted(i);
    M(x,y) = M(x,y) + 1;
end

% M = M/sum(sum(M));