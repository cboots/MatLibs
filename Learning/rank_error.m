%% r_err = rank_error(ranks, Y)
% Calculate rank error from NxK ranks matrix and true labels Y
% Ranks is NxK and contains the uniquely numbered rankings of each class K
% Each row contains the predicted classes in order left to right of
% preference. (i.e. 3, 1, 2) indicates the following rankings:
% 1. Class 3
% 2. Class 1
% 3. Class 2
function r_err = rank_error(ranks, Y)
[ri, ~] = find(bsxfun(@eq, ranks, Y)');
r_err = 1-1./ri;
end