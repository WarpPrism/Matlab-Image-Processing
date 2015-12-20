function [] = handleRGBImage2(image)
	R_channel = image(:, :, 1);
	G_channel = image(:, :, 2);
	B_channel = image(:, :, 3);
	[imgM, imgN] = size(R_channel);
	zero = zeros(imgM, imgN);
	Rk = [];
	for ii = 1:256
		Rk(ii) = ii - 1;
	end

	R_hist = get_hist_data(R_channel);
	G_hist = get_hist_data(G_channel);
	B_hist = get_hist_data(B_channel);

	average_hist = [];
	for i = 1:256
		average_hist(i) = (R_hist(i) + G_hist(i) + B_hist(i)) / 3;
	end
	% Show average histogram.
	figure('Name', 'Average Histogram');
	bar(Rk, average_hist);

	for i = 1:imgM
		for j = 1:imgN
			pixel = R_channel(i, j);
			Sk = 0;
			for k = 1:(pixel + 1)
				Sk = Sk + average_hist(k);
			end
			Sk = 255 * Sk;
			R_channel(i, j) = Sk;
		end
	end

	for i = 1:imgM
		for j = 1:imgN
			pixel = G_channel(i, j);
			Sk = 0;
			for k = 1:(pixel + 1)
				Sk = Sk + average_hist(k);
			end
			Sk = 255 * Sk;
			G_channel(i, j) = Sk;
		end
	end

	for i = 1:imgM
		for j = 1:imgN
			pixel = B_channel(i, j);
			Sk = 0;
			for k = 1:(pixel + 1)
				Sk = Sk + average_hist(k);
			end
			Sk = 255 * Sk;
			B_channel(i, j) = Sk;
		end
	end


	Final = cat(3, R_channel, G_channel, B_channel);
	imtool(Final);
end

