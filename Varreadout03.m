h = 130;    v = 142; Np = h*v; data = ones(h,v);j=1;
Contentsh = ["1","10","25"',"50","75","100","175","200","250","300","400","500","600","700","900","1100","1300","1500"];
raw = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(j)+'.csv'));
for i = 1:h                                                     %load arrays to match pictures
        data(i,:) = raw(((i-1)*v)+1:(i*v));
end
truim = data(3:h,:);                                            %remove reference pixels
offset = 4.7779e3;                                              %offset is mean of dark image pixels for a CCD
mu = sum(sum(truim))/Np;
Var = sum(sum((truim-offset-mu).^2))/Np
sigma = sqrt(Var)