h = 132;    v = 142; Np = h*v; data = ones(h,v);   datar = ones(h,v);
Contentsh = ["1","10","25","50","75","100","175","200","250","300","400","500","600","700","900","1100","1300","1500"];
Contents = ["1","5","10","25","50","100","200","350","450","550","1000","2000","2500"];
Var = 1:length(Contentsh); mean = 1:length(Contentsh); j=150;
for j = 1:length(Contentsh)
    raw = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(Contentsh(j))+'.csv'));
    rawr = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(Contentsh(j))+'r.csv'));
    for i = 1:h                                                     %load arrays to match pictures
        data(i,:) = raw(((i-1)*v)+1:(i*v));
    end
    for i = 1:h
        datar(i,:) = rawr(((i-1)*v)+1:(i*v));
    end
    truepic = data(3:h,:);                  truepicr = datar(3:h,:);  %ignore top 2 rows of pixels
    Var(j) = 0.5*(sum(sum((truepic-truepicr).^2))/Np);                %Variance between images
    mean(j) = sum(sum(truepic(:,1:134)))/(130*134);
end
sigma = sqrt(Var);                                                 %RMS standard deviation
Y = log(sigma);                                                    %X and Y values to plot on graph
X = log(mean);
scatter(X,Y);
xlabel('log(Intensity)')
ylabel('log(RMS noise)')
