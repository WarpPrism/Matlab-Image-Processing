function [ output_img ] = filter2d( input_img , filter_size)
% A function that performs spatial filtering on a gray scale image

	% Get the width and height of input_img
	[imgM, imgN] = size(input_img);


	% Compute the padding bit of input_img.
	paddingbit = floor(filter_size / 2);
	p = paddingbit;

	% Enlarge the input_img by paddingbit with 0
	new_img = zeros(imgM + 2 * p, imgN + 2 * p);
	output_img = zeros(imgM + 2 * p, imgN + 2 * p);
	[newM, newN] = size(new_img);

	for i = (1 + p):(imgM + p)
		for j = (1 + p):(imgN + p)
			new_img(i, j) = input_img(i - p, j - p);
		end
	end

	% Compute Arithmetic Mean filter
	for i = (1 + p):(imgM + p)
		for j = (1 + p):(imgN + p)
			sums = 0;
			for a = 1:filter_size
				for b = 1:filter_size
					sums = sums + new_img(i- p + a - 1, j - p + b - 1);
				end
			end
			% Blur
			output_img(i, j) = sums / (filter_size * filter_size);
		end
	end

	% Show output.
	output_img = uint8(output_img);
	imtool(output_img);
end