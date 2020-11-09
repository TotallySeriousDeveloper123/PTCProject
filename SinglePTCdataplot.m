h = 132;    v = 142; Np = h*v; data = ones(h,v);   datar = ones(h,v); j=1500;    
%dimensions h and v, number of pixels, j is desired picture from array
%add/remove h in line 6/7 to change referenced array
Contents = ["1","5","10","25","50","100","200","350","450","550","1000","2000","2500"];
Contentsh = ["1","10","25","50","75","100","175","200","250","300","400","500","600","700","900","1100","1300","1500"];
raw = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(j)+'.csv'));
rawr = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(j)+'r.csv'));
%load from file 2 pictures
for i = 1:h                                                     %load arrays to match pictures
        data(i,:) = raw(((i-1)*v)+1:(i*v));
        i=i+1;
end
for i = 1:h
        datar(i,:) = rawr(((i-1)*v)+1:(i*v));
        i=i+1;
end
truepic = data(3:h,:);                  truepicr = datar(3:h,:);  %ignore top 2 rows of pixels
truepic = truepic - (sum(sum(truepic))./Np);     truepicr = truepicr - (sum(sum(truepicr))./Np);    %calculate offset
Var = 0.5*(sum(sum((truepic-truepicr).^2))/Np)                                                      %Variance between images
sigma = sqrt(Var)                                                 %RMS standard deviation
Y = log10(sigma)                                                  %X and Y values to plot on graph
X = log10(j)