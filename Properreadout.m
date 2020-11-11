h = 132;    v = 142; Np = h*v; data = ones(h,v);   datar = ones(h,v); j=10;
Contentsh = ["1","10","25"',"50","75","100","175","200","250","300","400","500","600","700","900","1100","1300","1500"];
Contents = ["1","5","10","25","50","100","200","350","450","550","1000","2000","2500"];
raw = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(j)+'.csv'));
rawr = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(j)+'r.csv'));
for i = 1:h                                                     %load arrays to match pictures
        data(i,:) = raw(((i-1)*v)+1:(i*v));
end
for i = 1:h
        datar(i,:) = rawr(((i-1)*v)+1:(i*v));
end
truepic = data(3:h,:);
pixelextrema = [0 0];
pixelextrema(1) = max(max(truepic));
pixelextrema(2) = min(min(truepic));
correctdat = (truepic-pixelextrema(2))/(pixelextrema(1)-pixelextrema(2)).*255;
image(correctdat)