function [] = RGBToGray(image)
	% Works only for 24-bit
	[srcM, srcN] = size(image);

	R_channel = image(:, :, 1);
	G_channel = image(:, :, 2);
	B_channel = image(:, :, 3);

	[channel_M, channel_N] = size(R_channel);

	gray_image = [];
	for i = 1:channel_M
		for j = 1:channel_N
			pixel = R_channel(i, j) * 0.299 + G_channel(i, j) * 0.587 + B_channel(i, j) * 0.114;
			gray_image(i, j) = pixel;
		end
	end

	imtool(G_channel);
end

