function [fidx val max_ig] = dt_choose_feature_multi(X, Z, Xrange, colidx)
% DT_CHOOSE_FEATURE_MULTI - Selects feature with maximum multi-class IG.
%
% Usage:
% 
%   [FIDX FVAL MAX_IG] = dt_choose_feature(X, Z, XRANGE, COLIDX)
%
% Given N x D data X and N x K indicator labels Z, where X(:,j) can take on values in XRANGE{j}, chooses
% the split X(:,FIDX) <= FVAL to maximize information gain MAX_IG. I.e., FIDX is
% the index (chosen from COLIDX) of the feature to split on with value
% FVAL. MAX_IG is the corresponding information gain of the feature split.
%
% Note: The relationship between Y and Z is that Y(i) = find(Z(i,:)).
% Z is the categorical representation of Y: Z(i,:) is a vector of all zeros
% except for a one in the Y(i)'th column.
% 
% Hint: It is easier to compute entropy, etc. when using Z instead of Y.
%
% SEE ALSO
%    DT_TRAIN_MULTI

%Get entropy of Z distribution.  By taking the mean, Z is compressed into a
%1 x K vector where (1, i) is the p(Y=y_i). Transpose to make K x 1 
H = multi_entropy(mean(Z)');

%Compute conditional entropy for each feature.
%Preallocate for speed
ig = zeros(numel(Xrange), 1);
split_vals = zeros(numel(Xrange), 1);

% Compute the IG of the best split with each feature. This is vectorized
% so that, for each feature, we compute the best split without a second for
% loop.
t = CTimeleft(numel(colidx));
K = size(Z,2);
fprintf('Evaluating features on %d examples: ', size(X,1));
for i = colidx
    t.timeleft();

    % Check for constant values.
    if numel(Xrange{i}) == 1
        ig(i) = 0; split_vals(i) = 0;
        continue;
    end
    
    r = linspace(Xrange{i}(1), Xrange{i}(end), min(10, numel(Xrange{i})));
    cond_H = zeros(1, numel(r));
    % Compute up to 10 possible splits of the feature.
    for j=1:numel(r) %TODO Vectorize
        %Compute IG for each split, and record maximum
        %compute H(Y|X)
        px = mean(X(:,i)<=r(j));
        y_given_lex = sum(bsxfun(@and, X(:,i) <= r(j), Z));
        y_given_gtx = sum(bsxfun(@and, X(:,i) > r(j), Z));
        cond_H(j) = px*multi_entropy(y_given_lex'./sum(y_given_lex))+ ...
            (1-px)*multi_entropy(y_given_gtx'./sum(y_given_gtx));
    end
    
    % Choose split with best IG, and record the value split on.
    [ig(i) best_split] = max(H-cond_H);
    split_vals(i) = r(best_split);
end

% Choose feature with best split.
[max_ig fidx] = max(ig);
val = split_vals(fidx);