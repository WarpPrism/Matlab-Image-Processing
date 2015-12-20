function [ output_img ] = harmonic( input_img, filter_size)
% A function that performs harmonic mean filtering on a image

	% Get the width and height of input_img and filter.
	[imgM, imgN] = size(input_img);
	filterM = filter_size;
	filterN = filter_size;


	% Compute the padding bit of input_img.
	paddingbit = floor(filterM / 2);
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

	%Harmonic Mean Filter
	
	for i = (1 + p):(imgM + p)
		for j = (1 + p):(imgN + p)
			sums = 0;
			for a = 1:filterM
				for b = 1:filterN
					if (new_img(i - p + a - 1, j - p + b - 1) == 0)
						sums = sums + 99999;
					else
						sums = sums + (1 / new_img(i - p + a - 1, j - p + b - 1));
					end
				end
			end
			output_img(i, j) = filterM * filterN / (sums);
		end
	end

	% Show output.
	output_img = uint8(output_img);
	imtool(output_img);
end