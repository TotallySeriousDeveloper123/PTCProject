rawa = Tiff(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\DataCollection\Non-uniformillumination\New Folder\1\1.tif'));
rawb = Tiff(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\DataCollection\Non-uniformillumination\New Folder\2\2.tif'));
off=100;
inp = int64(read(raw))-off;
interval = 100;
Var = ones(1,(2*1200)/interval); signal = ones(1,(2*1200)/interval);
a=1;
y=1;
x=1;
while y < 1200
    while x< 1200
        data = inp(x:x+interval-1,y:y+interval-1);
        mu = sum(sum(data))/numel(data);                              %mean
        Var(a) = sum(sum((data-mu).^2))/numel(data);                  %variance
        signal(a) = mu;
        x=x+interval;
        a=a+1;
    end
    x=1;
    y=y+interval;
end
sigma = sqrt(Var);
scatter(log(signal),log(sigma))
xlabel('log(Intensity)')
ylabel('log(Noise)')