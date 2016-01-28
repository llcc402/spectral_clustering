# The spectral clustering

We use the method proposed by Francis R. Bach and Michael I. Jordan. See http://papers.nips.cc/paper/2388-learning-spectral-clustering.pdf

## Functions included:

1. get_similarity: We use Gaussian kernel to model the similarity and the sensitivity is controled by the variable 'delta'. The result is got when we set delta to be 0.1, and when it is 1, the result is unsatisfiable.

2. spectral_clustering: get the cluster label.

## Figures included:

1. data.jpg: The generated data set.

2. loss.jpg: The loss in each iteration when excuting the clustering algorithm.

3. result.jpg: The clustered data.
