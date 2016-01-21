% Input:
%     K      a scalar. The number of clusters.
%     N      a scalar. The number of observations in each cluster.
% Output:
%     data   a matrix of two columns. Rows for observations.
function data = data_generate(K, N)
if nargin < 1
    K = 2;
end
if nargin < 2
    N = 1000;
end

data = zeros(N * K, 2);
sigma = 0.1;

for i = 1:K
    r = i;
    theta = rand(1, 1000) * 2 * pi;
    data((i*N-N)+1 : i*N, 1) = r * cos(theta) + randn(1, 1000) * sigma;
    data((i*N-N)+1 : i*N, 2) = r * sin(theta) + randn(1, 1000) * sigma;
end

plot(data(:,1), data(:,2), '.')

end
