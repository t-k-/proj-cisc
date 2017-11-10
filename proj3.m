x = sample_uniform(1000, 0, 1);
u = 0.5;
[a b] = ci(x, 3);

epsino = sqrt( 1/(2*N) * log(2/alpha));
if abs(mean(X) - true_mean) >= epsino
	h = h + 1;
end
