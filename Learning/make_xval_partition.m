function [part] = make_xval_partition(n, n_folds)
% MAKE_XVAL_PARTITION - Randomly generate cross validation partition.
%
% Usage:
%
%  PART = MAKE_XVAL_PARTITION(N, N_FOLDS)
%
% Randomly generates a partitioning for N datapoints into N_FOLDS equally
% sized folds (or as close to equal as possible). PART is a 1 X N vector,
% where PART(i) is a number in (1...N_FOLDS) indicating the fold assignment
% of the i'th data point.

% Randomly fill a vector with the numbers 1..N (using each number exactly
% once)
% Take each number mod N_FOLDS and add 1 to choose a partition for each
% position
part = mod(randperm(n), n_folds) + 1;

%Test Code
% for i=1:n_folds
%    disp(['Fold ' num2str(i) ': ' num2str(length(part(part == i)))])
% end
