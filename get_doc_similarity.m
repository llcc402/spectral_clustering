function W = get_doc_similarity(data)
% W = zeros(size(data,1), size(data,1));
% s = sum(data, 2);
% for i = 1:size(W,1)
%     for j = (i+1):size(W,1)
%         W(i,j) = data(i,:) * data(j,:)' / (s(i) + s(j));
%     end
% end
% W = W + W';
% W(1 : (size(W, 1)+1) : end) = 1;



% data should be tfidf weights
W = zeros(size(data, 1), size(data, 1));
n_row = zeros(1,size(data, 1));
for i = 1:length(n_row)
    n_row(i) = norm(data(i,:));
end
for i = 1:size(W,1)
    for j = 1:size(W,2)
        W(i,j) = data(i,:) * data(j,:)' / n_row(i) / n_row(j);
    end
end

end