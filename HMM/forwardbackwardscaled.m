%based on Scaled FB algorithm here: http://www.cs.tut.fi/kurssit/SGN-4106/nutshell.pdf
function [alpha beta s] = forwardbackwardscaled(O, A, B, Pi)
T = numel(O);
K = size(A,1);
N = size(B,1);

%Forward backward
alpha = zeros(T,K);
beta = zeros(T,K);
s = zeros(T,1);

%Init first state to P(O1|S1)P(S1)
alpha(1,:) = B(O(1),:).*Pi';
s(1) = sum(alpha(1,:))+eps;
alpha(1,:) = alpha(1,:)/s(1);%Scale

%Forward
for t=2:T
    %For each state
    %for j=1:K
    %1xK = 1xK * KxK .* 1*K
    alpha(t,:) = (alpha(t-1,:)*A(:,:)).*B(O(t),:);
    %end
    s(t) = sum(alpha(t,:))+eps;
    alpha(t,:) = alpha(t,:)/s(t);
end

%Backward
beta(T,:) = ones(1,K);

for t=T-1:-1:1
    %     for i=1:K
    %sum_j(A(i,j)*b_j(O_t+1)*beta_t+1(j)/s(t+1)
    % beta(t,i) = sum(A(i,:).*B(O(t+1),:).*beta(t+1,:))/s(t+1);
    beta(t,:) = sum(  bsxfun(@times, bsxfun(@times, A, B(O(t+1),:)), beta(t+1,:)), 2)/s(t+1);
    %     end
end


end