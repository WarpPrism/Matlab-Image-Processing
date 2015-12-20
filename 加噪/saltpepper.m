function [ output ] = saltpepper(input, p0, p1)
	pic = rgb2gray(input);

	[M, N] = size(pic);
	output = zeros(M, N);
	random = rand(M, N);

	for i = 1:M
		for j = 1:N
			if (random(i, j) < p1)
				output(i, j) = 255;
			else if (random(i, j) > (1 - p0))
				output(i, j) = 0;
			else
				output(i, j) = pic(i, j);
			end
		end
	end

	output = uint8(output);
end