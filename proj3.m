u = 0.5;
M = 12345;

for evalfun = 1:10
	str = sprintf('Evaluating function #%d:', evalfun);
	disp(str)
	for g = {'sample_uniform' 'sample_bernoulli' 'sample_normal'}
		for N = [10 20 50 1000 10000]
			experiment(N, M, g{:}, evalfun);
		end
	end
end

%experiment(1000, M, 'sample_normal', 1);

function p = experiment(N, M, genfun, evalfun)
	cnt = 0;
	for m = 1:M
		x = [];
		u = -1;
		if strcmp(genfun, 'sample_uniform') == 1
			x = sample_uniform(N, 0, 1);
			u = 0.5;
		elseif strcmp(genfun, 'sample_bernoulli') == 1
			u = rand();
			x = sample_bernoulli(N, u);
		elseif strcmp(genfun, 'sample_normal') == 1
			sigma = rand() * 2;
			u = rand();
			x = sample_normal(N, sigma, u);
		else
			disp('error')
			return
		end

		[a b] = ci(x, evalfun);
		if (a <= u) && (u <= b)
			cnt = cnt + 1;
		end
	end
	p = cnt / M;
	str = sprintf('[%s] probability to capture true mean: %d (N = %d)', genfun, p, N);
	disp(str)
end
