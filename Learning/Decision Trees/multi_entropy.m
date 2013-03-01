function [H] = multi_entropy(p)
% MULTI_ENTROPY - Compute H(P(X)) for discrete multi-valued X.
%
% Usage:
% 
%    H = multi_entropy(P)
%
%  Returns the entropy H = -\sum_x p(x) * log(p(x)).
%  For an K X N matrix P, H is a 1 x N vector of entropy for each of the 
%  N distributions over K values.

% Note: we need to correct for Matlab's insistence that 0 * -Inf = NaN.
% For entropy computation, 0 * log(0) = 0. This trick works because
% min(0,NaN) = 0, and log(P) <= 0 when P <= 1.
p_times_logp = @(x) min(0, x.*log2(x));

H = - sum(p_times_logp(p));