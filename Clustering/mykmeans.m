%% [assignments means] = mykmeans(features, k)
% Performs kmeans clustering with k clusters on the NxD 'features' matrix.
% N is the number of points, D is the number of feature dimensions
% Returns the indecies of the cluster centroids as 'assignments' (Nx1)
% Also returns the centroids of each cluster in a kxD matrix 'means' 
function [assignments means] = mykmeans(features, k)
N = size(features,1);
D = size(features,2);

%initialize means
means = zeros(k,D);%Each row represents a mean

%Random initialization for now
assignments = randi(k, N, 1);

change = true;
while(change)
    for i=1:k
        f = find(assignments==i);
        if ~isempty(f)
            %only compute mean if cluster not empty
            means(i,:) = mean(features(f,:),1);
        end
    end
    
    %Reassign
    for i=1:k
        dist(:,i) = sum((bsxfun(@minus, features, means(i,:))).^2,2);
    end
    
    [~, newAssign] = min(dist,[],2);
    if(all(newAssign == assignments))
        change = false;
        break;
    end
    assignments = newAssign;
end
end