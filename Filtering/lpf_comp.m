%%
% lpf_comp(raw, beta)
%   Implements a low pass complementary filter.
%   'raw' is an NxD matrix with N raw data points and D features
%   Each feature is filtered independently assuming the fisrt data point is
%   ground truth.
%   'beta' is a number between 0 - 1 indicating the strength of the LPF.
%   beta == 0 won't filter anything, beta == 1 will take the first value to
%   be constant and unchanging
function filtered = lpf_comp(raw, beta)
    prev = raw(1,:);
    filtered = zeros(size(raw));
    
    %filter
    for i=1:size(raw,1)
        filtered(i,:) = prev*beta + raw(i,:)*(1-beta);
        prev = filtered(i,:);
    end
end