function [ Nk ] = equalize_hist( input_img )
% get hist data of input_img

	[srcM, srcN] = size(input_img);

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
end

