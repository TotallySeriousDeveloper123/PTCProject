h = 130;    v = 142; Np = h*v;  j=1500;
data = ones(h,v); Var = 1:length(Contentsh); intensity = 1:length(Contentsh);
Contentsh = ["1","10","25"',"50","75","100","175","200","250","300","400","500","600","700","900","1100","1300","1500"];
dark =load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h1.csv'));
for i = 1:h                                                     %load arrays to match pictures
        darkm(i,:) = dark(((i-1)*v)+1:(i*v));
end
trudar = darkm(3:h,:);                                           %remove reference pixels
offset = sum(sum(trudar))/Np;                                   %offset is mean of dark image pixels for a CCD
for j = 1:length(Contentsh)
    raw = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(Contentsh(j))+'.csv'));
    for i = 1:h                                                     %load arrays to match pictures
        data(i,:) = raw(((i-1)*v)+1:(i*v));
    end
    truim = data(3:h,:);
    mu = sum(sum(truim))/Np;
    Var(j) = sum(sum((truim-offset-mu).^2))/Np;
    Intensity(j) = mu;
end
sigma = sqrt(Var);
scatter(log10(Intensity),log10(sigma))
xlabel('log(Intensity)')
ylabel('log(Noise)')
% Y = [4.6670e3 4.6669e3 4.6665e3 4.6762e3 4.6877e3 5.0757e3];
% X = [4.7779e3 4.7860e3 4.8678e3 5.2063e3 5.5189e3 6.1656e3];
% scatter(log10(X),log10(Y))