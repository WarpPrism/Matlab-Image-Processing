function [ output ] = gaussion( input, u, v )

	pic = rgb2gray(input);

	[M,N] = size(pic);
	y = randn(M,N);
	y1 = reshape(y,M*N,1);

	y = y/std(y1);   

	y = y-mean(y1);
	v = sqrt(v);

	y = u+v*y;
	pic = double(pic);
	pic = pic+y;
	output = uint8(pic);

	figure;
	imshow(output);
end

