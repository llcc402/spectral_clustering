% Input:
%      data     a matrix. Rows are for docs and columns are for words.
% Output:
%      w        a matrix of the same size as data.
% Model:
%       tfidf(i,j) =  tf(i,j) * idf(i,j)
%
%                        number of term j in doc i
%       tf(i,j)    =  ---------------------------------
%                      total number of terms in doc i
%
%                                   number of docs
%       idf(i,j)   =  log(-----------------------------------)
%                           number of docs containing term j  
function w = tfidf(data)
w = zeros(size(data));
s = sum(data,2);
for i = 1:size(data,1)
    for j = 1:size(data,2)
        w(i,j) = data(i,j) / s(i) * log(size(data,1) / sum(data(:,j) > 0));
    end
end
end