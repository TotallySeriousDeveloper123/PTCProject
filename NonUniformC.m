addpath('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Matlab\DarkNoise\bfmatlab')
xpixel = [10 42 158 586 742 338 314 394 974 986 978 978 954 1058];
ypixel = [54 866 930 998 1026 722 142 438 614 210 402 570 702 1010 966];
imnum=500;
VAR = ones(1,length(xpixel));MEAN = ones(1,length(xpixel));
DATA = bfopen('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\DataCollection\Non-uniformillumination\15Dec2020\multiple\despeckleon\despeckleon_MMStack_Default.ome');
pixelvalue = ones(1,imnum);
% for y = 1:square
    for j = 1:length(xpixel)
        for z = 1:imnum
            RAW = int64(DATA{1,1}{z,1});
            pixelvalue(z) = RAW(xpixel(j),ypixel(j));
        end
    MU = sum(pixelvalue)/numel(pixelvalue);
    VAR(j) = sum((pixelvalue-MU).^2)/imnum;
    MEAN(j) = MU;
%     end
end
% NOISE = sqrt(VAR(:)');
% SIGNAL = MEAN(:)';
scatter(log(MEAN),log(sqrt(VAR)));
xlabel('Intensity');
ylabel('Noise')
title('Non Uniform Stack Images n = 500')