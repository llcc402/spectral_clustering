% Input:
%     data        a matrix with two columns. Rows for observations.
% Output:
%     W           a similarity matrix.
function W = get_similarity(data)
W = zeros(size(data, 1));
for i = 1:size(W,1)
    for j = 1:size(W,2)
        dist = data(i,:) - data(j,:);
        W(i,j) = sum(dist.^2);
    end
end
       
end