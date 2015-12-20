function [] = handleRGBImage(image)
	R_channel = image(:, :, 1);
	G_channel = image(:, :, 2);
	B_channel = image(:, :, 3);
	[imgM, imgN] = size(R_channel);
	zero = zeros(imgM, imgN);
	% R_image = cat(3, R_channel, zero, zero);
	% G_image = cat(3, zero, G_channel, zero);
	% B_image = cat(3, zero, zero, B_channel);

	% subplot(2,2,1),imshow(R_image),title('Red Channel');
	% subplot(2,2,2),imshow(G_image),title('Green Channel');
	% subplot(2,2,3),imshow(B_image),title('Blue Channel');

	R_equa = equalize_hist(R_channel);
	G_equa = equalize_hist(G_channel);
	B_equa = equalize_hist(B_channel);

	Final = cat(3, R_equa, G_equa, B_equa);
	imtool(Final);
end

