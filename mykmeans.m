function [z, mu] = mykmeans(data, k)

%--------------------------------------------------------------------------
% STEP 1: Init
%--------------------------------------------------------------------------
z = randi(k, size(data, 1), 1);
mu = zeros(k, size(data, 2));
maxIter = 100;
loss = zeros(1, maxIter);

%--------------------------------------------------------------------------
% STEP 2: kmeans
%--------------------------------------------------------------------------
for iter = 1:maxIter
    % E step
    ix = accumarray(z, 1:length(z), [], @(x){x});
    for i = 1:length(ix)
        if ~isempty(ix{i})
            mu(i,:) = mean(data(ix{i}, :));
        end
    end
    
    % M step
    for i = 1:length(z)
        diff = repmat(data(i,:), k, 1) - mu;
        dist = sum(diff .^ 2, 2);
        [loss_1, z(i)] = min(dist);
        loss(iter) = loss(iter) + loss_1;
    end
end
plot(loss)
end

