function [ output_img ] = equalize_hist( input_img )
% Do histogram equalization on given image.
% And show the histogram of input_img and output_img

	[srcM, srcN] = size(input_img);
	output_img = zeros(srcM, srcN);

	% Compute the total number of pixel.
	n = srcM * srcN;

	% Rk is the pixel of image 0 ~ 255
	Rk = [];
	% Nk is the number of pixel Rk in the image.
	Nk = [];
	% Initialize Array Rk and Nk.
	for ii = 1:256
		Nk(ii) = 0;
		Rk(ii) = ii - 1;
	end

	% Compute numbers of each pixel in input_img
	for i = 1:srcM
		for j = 1:srcN
			pixel = input_img(i, j);
			Nk(pixel + 1) = Nk(pixel + 1) + 1;
		end
	end

	% Compute normalized histogram of input_img
	for ii = 1:256
		Nk(ii) = Nk(ii) / n;
	end
	% show histogram of input_img
	% figure('Name', 'Histogram of input_img');
	% bar(Rk, Nk);

	% Compute and show the CDF
	% CDF = zeros(1, 256);
	% s = 0;
	% for iter = 1:256
	% 	s = s + Nk(iter);
	% 	CDF(iter) = s;
	% end
	% figure('Name', 'CDF');
	% bar(Rk, CDF);

	% Histogram Equalization Algorithm
	for i = 1:srcM
		for j = 1:srcN
			pixel = input_img(i, j);
			Sk = 0;
			% Compute discrete CDF.
			for k = 1:(pixel + 1)
				Sk = Sk + Nk(k);
			end
			Sk = 255 * Sk;
			output_img(i, j) = Sk;
		end
	end

	output_img = uint8(output_img);


	% Clear Array Nk and Rk
	for ii = 1:256
		Nk(ii) = 0;
		Rk(ii) = ii - 1;
	end


	% Compute number of each pixel in output_img
	for i = 1:srcM
		for j = 1:srcN
			pixel = output_img(i, j);
			Nk(pixel + 1) = Nk(pixel + 1) + 1;
		end
	end

	% Compute normalized histogram of output_img
	for ii = 1:256
		Nk(ii) = Nk(ii) / n;
	end
	% show histogram of output_img
	% figure('Name', 'Histogram of output_img');
	% bar(Rk, Nk);


	% Show input_img and output_img
	% figure('Name', 'input_img');
	% imshow(input_img);
	% figure('Name', 'output_img');
	imtool(output_img);
end

