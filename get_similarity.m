% Input:
%     data        a matrix with two columns. Rows for observations.
% Output:
%     W           a similarity matrix.
function W = get_similarity(data, delta)
W = zeros(size(data, 1));

for i = 1:size(W,1)
    for j = (i+1):size(W,2)
        dist = data(i,:) - data(j,:);
        W(i,j) = exp(-sum(dist.^2) / delta);
    end
end
W = W + W';
W(1:size(W,1)+1:end) = 1;
threshold = prctile(W(:), 97);
W(W < threshold) = 0;
        
end