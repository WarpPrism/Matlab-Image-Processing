function [ output_img ] = contraharmonic( input_img, filter_size)
% A function that performs contraharmonic mean filtering on a image

	Q = 2;
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

	%Contraharmonic Mean Filter
	
	for i = (1 + p):(imgM + p)
		for j = (1 + p):(imgN + p)
			sum1 = 0;
			sum2 = 0;
			flag = 0;
			for a = 1:filterM
				for b = 1:filterN
					pixel = new_img(i - p + a - 1, j - p + b - 1);
					if (pixel == 0)
						flag = 1;
						output_img(i, j) = 0;
					else
						sum1 = sum1 + pixel^(Q+1);
						sum2 = sum2 + pixel^Q;
					end
				end
			end
			if (flag ~= 1)
				output_img(i, j) = sum1 / sum2;
			end
		end
	end

	% Show output.
	output_img = uint8(output_img);
	imtool(output_img);
end