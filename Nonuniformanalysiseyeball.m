raw = Tiff(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\DataCollection\Non-uniformillumination\Setup\7Dec\single(1ms)\-15C\-15C.tif'));
inp = int64(read(raw))-off;
x1 = [223 213 423 660 880 874 1105 663 884 666 914 265 232 432 433 662 872];
x2 = [368 378 572 788 1062 1070 1182 816 980 806 986 416 416 587 574 796 1086];
y1 = [16 187 17 10 17 154 281 508 510 670 794 808 1006 1021 808 958 1141];
y2 = [130 344 342 172 122 318 382 650 708 820 878 990 1186 1186 1002 1182 1186];
Var = ones(1,length(x1)); signal = ones(1,length(x1));
for j = 1:length(x1)
    data = inp(x1(j):x2(j),y1(j):y2(j))
    mu = sum(sum(data))/numel(data);                              %mean
    Var(j) = sum(sum((data-mu).^2))/numel(data);                  %variance
    signal(j) = mu;
end
sigma = sqrt(Var); 
scatter(log(signal),log(sigma))
xlabel('log(Intensity)')
ylabel('log(Noise)')