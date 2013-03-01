function [y] = nb_test(nb, X)
% Generate predictions for a Gaussian Naive Bayes model.
%
% Usage:
%
%   [Y] = NB_TEST(NB, X)
%
% X is a N x P matrix of N examples with P features each, and NB is a struct
% from the training routine NB_TRAIN. Generates predictions for each of the
% N examples and returns a 0-1 N x 1 vector Y.
% 
% SEE ALSO
%   NB_TRAIN

% YOUR CODE GOES HERE (compute log_p_x_and_y)
%log(P(Y==y))+ sum_i^m{log(P(x_i|Y==y))}
%Calculate p_x_y_0(n,i) = P(x_i|Y==0)
p_x_y_0 = bsxfun(@times, (1/sqrt(2*pi))./nb.sigma_x', ...
                exp(-1/2*(bsxfun(@rdivide, ...
                        bsxfun(@minus, X, nb.mu_x_given_y(:,1)'), ... 
                        nb.sigma_x')).^2));
                    
%Calculate p_x_y_1(n,i) = P(x_i|Y==1)
p_x_y_1 = bsxfun(@times, (1/sqrt(2*pi))./nb.sigma_x', ...
                exp(-1/2*(bsxfun(@rdivide, ...
                        bsxfun(@minus, X, nb.mu_x_given_y(:,2)'), ... 
                        nb.sigma_x')).^2));
                    
%nx2 array that allows comparison of log(P(D|Y==0)) (col1) 
%                                and log(P(D|Y==1)) (col2)

log_p_x_and_y = [log(1-nb.p_y) + sum(log(p_x_y_0),2), log(nb.p_y) + sum(log(p_x_y_1),2)];

% Take the maximum of the log generative probability 
[~, y] = max(log_p_x_and_y, [], 2);
% Convert from 1,2 based indexing to the 0,1 labels
y = y -1;



    
