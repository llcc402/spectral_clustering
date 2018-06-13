% init parameters
K = 2;
N = 1000;
maxIter = 500;

% generate dataset
data = data_generate(K, N);

% get the similarity matrix
W = get_similarity(data, 1);

% get the clustering results
[Z, loss] = spectral_clustering(W, K, maxIter);

plot(data(Z == 1, 1), data(Z == 1, 2), '.')
hold on
plot(data(Z == 2, 1), data(Z == 2, 2), '*')
hold off