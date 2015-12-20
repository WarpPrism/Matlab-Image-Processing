function [ output_img ] = filter2d( input_img )
% A function that performs spatial filtering on a gray scale image

	filter = zeros(3,3);

	% Get the width and height of input_img and filter.
	[imgM, imgN] = size(input_img);
	[filterM, filterN] = size(filter);


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

	% % Compute Algorithm Mean filter
	% for i = (1 + p):(imgM + p)
	% 	for j = (1 + p):(imgN + p)
	% 		sums = 0;
	% 		for a = 1:filterM
	% 			for b = 1:filterN
	% 				sums = sums + new_img(i- p + a - 1, j - p + b - 1) * filter(a, b);
	% 			end
	% 		end
	% 		% Blur
	% 		output_img(i, j) = sums;

	% 		% Sharpen
	% 		% output_img(i, j) = new_img(i, j) - sums;
				
	% 		% High boost filtering
	% 		% gmask = new_img(i, j) - sums;
	% 		% k = 7;
	% 		% output_img(i, j) = new_img(i, j) + k * gmask; 
	% 	end
	% end

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