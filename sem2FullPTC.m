Intensity = ["1" "5" "10" "50" "100" "250" "500" "1000" "2500" "5000" "10000"];
%Tiff(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\DataCollection\DarkNoiseDat\15Dec2020\DespeckleON\'+Intensity(j)+'\'+Intensity(j)+'.tif'));
Var = ones(1,length(Intensity)); signal = ones(1,length(Intensity));
off=100;    
for j = 1:length(Intensity) %Loop through each image and find individual variance and mean intensity
    rawa = Tiff(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\DataCollection\Prime95B\ChangeLED\15Dec2020\run1\'+string(j)+'a\'+string(j)+'a.tif'));   %load tiff
    rawb = Tiff(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\DataCollection\Prime95B\ChangeLED\15Dec2020\run1\'+string(j)+'b\'+string(j)+'b.tif'));
%     %single image
%     inp = int64(read(rawa))-off;                                
%     dat = inp(1:451,239:595);
%     mu = sum(sum(dat))/numel(dat);                              %mean
%     Var(j) = sum(sum((dat-mu).^2))/numel(dat);                  %variance
%     signal(j) = mu;                                             %assign mean
%     %single image end
    %remove FPN
    inpA = int64(read(rawa))-off;
    datA = inpA(1:451,239:595);
    inpB = int64(read(rawb))-off;
    diff = (inpA-inpB);
    mu = sum(sum(diff))/numel(diff);
    diff = diff-mu;
    Var(j) = sum(sum(diff.^2))/(numel(datA));
    signal(j) = sum(sum(datA))/numel(datA);
%     %end of FPN remove
end
sigma = sqrt(Var)/sqrt(2);                                      %standard deviation (noise)
output = ones(2,11)';
output(:,1)=log(signal);
output(:,2)=log(sigma);
%scatter(signal,sigma);xlabel('Intensity');ylabel('Noise')
%sigma(16) = 1;
scatter(log(signal),log(sigma))
title('FPN removal Prime95B corrected (LED)')
xlabel('log(Intensity)')
ylabel('log(Noise)')