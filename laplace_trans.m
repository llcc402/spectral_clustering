function vecs = laplace_trans(W, k)
D = diag(sum(W));
L = D - W;
[vecs, ~] = eigs(L/D, k);
end