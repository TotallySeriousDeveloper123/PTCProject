%Intensity = ["172.3e-3" "1.95" "2.257" "2.45" "2.63" "2.84" "3.06" "3.19" "3.4" "3.66" "3.85" "6.09" "test"  "1.236" "1.47" "fullwell"];
Var = ones(1,12); signal = ones(1,12);
off=100;    
for j = 1:12 %Loop through each image and find individual variance and mean intensity
    rawa = Tiff(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\DataCollection\ChangeLED\15Dec2020\run2\'+string(j)+'a\'+string(j)+'a.tif'));   %load tiff
    rawb = Tiff(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\DataCollection\ChangeLED\15Dec2020\run2\'+string(j)+'b\'+string(j)+'b.tif'));
    %single image
    inp = int64(read(rawa))-off;                                
    dat = inp(1:451,239:595);
    mu = sum(sum(dat))/numel(dat);                              %mean
    Var(j) = sum(sum((dat-mu).^2))/numel(dat);                  %variance
    signal(j) = mu;                                             %assign mean
    %single image end
    %remove FPN
    inpA = int64(read(rawa))-off;
    datA = inpA(1:451,239:595);
    inpB = int64(read(rawb))-off;
    datB = inpB(1:451,239:595);
    Var(j) = sum(sum((datA-datB).^2))/(2*numel(datA));
    signal(j) = sum(sum(datA))/numel(datA);
    %end of FPN remove
end
sigma = sqrt(Var);                                      %standard deviation (noise)
%scatter(signal,sigma);xlabel('Intensity');ylabel('Noise')
%sigma(16) = 1;
scatter(log(signal),log(sigma))
title('Title Here')
xlabel('log(Intensity)')
ylabel('log(Noise)')