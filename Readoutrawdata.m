h = 132;    v = 142;
Contents = ["1","5","10","25","50","100","200","350","450","550","1000","2000","2500"];
j = 2000;    %1 100 450 2000
scale = 100;
name = append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\'+string(j)+'.csv');
namer = append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\'+string(j)+'r.csv');
raw = load(name);   rawr = load(namer);
data = ones(h,v);   datar = ones(h,v);
for i = 1:h                                                     %load arrays to match pictures
        data(i,:) = raw(((i-1)*v)+1:(i*v));
        i=i+1;
end
for i = 1:h
        datar(i,:) = rawr(((i-1)*v)+1:(i*v));
        i=i+1;
end
mean = sum(sum(data))./(h*v);
meanr = sum(sum(datar))./(h*v);
C = data-mean;
image(C./scale);
colorbar
figure
Cr = datar-meanr;
image(Cr./scale)
colorbar