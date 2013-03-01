function [grad] = lr_gradient(X, Y, w, C)
% Compute the Logistic Regression gradient.
%
% Usage:
%
%    [GRAD] = LR_GRADIENT(X, Y, W, C)
%
% X is a N x P matrix of N examples with P features each. Y is a N x 1 vector
% of (-1, +1) class labels. W is a 1 x P weight vector. C is the regularization
% parameter. Computes the gradient w.r.t. W of the regularized logistic
% regression objective and returns a 1 x P vector GRAD.
%
% SEE ALSO
%   LR_TRAIN, LR_TEST

%L(w) = log(P(Y|X,w))-C/2*w'*w

grad = sum(bsxfun(@times, bsxfun(@times, Y, X),...
            (1-1./(1+exp(-Y.*sum(bsxfun(@times,w,X),2)))))) - C*w;