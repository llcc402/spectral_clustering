function [z, vecs] = sym_cluster(data, k)
%--------------------------------------------------------------------------
% STEP 1: Compute similarity matrix. 
%--------------------------------------------------------------------------
%              number of shared words of i and j  
% sim(i,j) = ------------------------------------
%               total number of words of i and j

data(data > 1) = 1; % some words are recorded many times
W = data * data';
doc_num = sum(data, 2);
S = repmat(doc_num, 1, size(data, 1)) + repmat(doc_num', size(data, 1), 1);
W = W ./ S;
%--------------------------------------------------------------------------
% STEP 2: Spectral clustering
%--------------------------------------------------------------------------
d = sum(W, 2);
d = d .^ (-1/2);
D = diag(d);
[vecs, ~] = eigs(D * W * D, k);
z = mykmeans(vecs, k);