% Input:
%     W          a symetric matrix. It is the similarity matrix of the
%                observations.
%     K          a scalar. The number of clusters.
%     maxIter    a scalar. The maximum number of k-means iterations.
% Output:
%     Z          a row vector of length the order of W. Indicate which
%                cluster the corresponding observation comes from.
%     loss       a scalar. The loss of the model.
function [Z, loss] = spectral_clustering(W, K, maxIter)
if nargin < 3
    maxIter = 100;
end

%--------------------------------------------------------------------------
% STEP 1: Compute the eigen vectors
%--------------------------------------------------------------------------
D = sum(W, 2);
d = D;
D = diag(1 ./ (sqrt(D)));
[vecs, ~] = eigs(D * W * D, K);

%--------------------------------------------------------------------------
% STEP 2: Weighted K-means
%--------------------------------------------------------------------------

% init indicators
Z = unidrnd(K, 1, size(W, 1));

% init centers
C = zeros(K, K);

% init loss
loss = zeros(1, maxIter);

for iter = 1:maxIter
    % ix is a cell. In each cell k, it is all the indices of the
    % observations that are assigned to cluster k.
    ix = accumarray(Z', 1:length(Z), [], @(x){x});
    
    % get centers
    for k = 1:K
        if ~isempty(ix{k})
            numeritor = sum( repmat(sqrt(d(ix{k})), 1, K) .* vecs(ix{k}, :) );
            denominator = sum(d(ix{k}));
            C(k,:) = numeritor / denominator;
        end
    end
    
    % assign
    for i = 1:length(Z)
        % get point-center distance
        dist = repmat(vecs(i,:) / sqrt(d(i)), K, 1) - C;
        dist = sum(dist .^ 2, 2) ;
        [~, Z(i)] = min(dist);
        
        loss(iter) = loss(iter) + dist(Z(i)) * d(i);
    end
end
plot(1:maxIter, loss)
end
