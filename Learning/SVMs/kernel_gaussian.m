function K = kernel_gaussian(X, X2, sigma)
% Evaluates the Gaussian Kernel with specified sigma
%
% Usage:
%
%    K = KERNEL_GAUSSIAN(X, X2, SIGMA)
%
% For a N x D matrix X and a M x D matrix X2, computes a M x N kernel
% matrix K where K(i,j) = k(X(i,:), X2(j,:)) and k is the Guassian kernel
% with parameter sigma=20.

% HINT: Transpose the sparse data matrix X, so that you can operate over columns. Sparse
% column operations in matlab are MUCH faster than row operations.
Xt = X';%Dxn

%L2 norm squared term expanded into three dot prodcuts
aa = sum(Xt.^2);%1xn
bb = sum(X2.^2,2);%mx1
ab = X2*Xt;%mxn

K = exp(-(bsxfun(@plus, aa, bb)-2*ab)/(2*sigma^2));



