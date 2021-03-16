data = ones(130,142); h=130;
names  = ["1" "10" "25" "50" "100" "175" "200" "250" "300" "400" "500" "600" "700" "900" "1100" "1300" "1500"];
hold = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h1.csv'));
dark = ones(130,142); Noise = length(names); signal = length(names);
for i = 1:h
    dark(i,:) = hold(((i-1)*142)+1:(i*142));
end
dar = dark(3:h,:);
offset = sum(sum(dar(1:3,:)))/(3*142);
for j = 1:length(names)
    raw = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(names(j))+'.csv'))-offset;
    rbw = load(append('C:\Users\alasd\OneDrive\Documents\!UniWork\Project\Extra\csv_images\csv_images\h'+string(names(j))+'r.csv'))-offset;
    signal(j) = sum(sum(raw+offset))/numel(raw);
    rcw = (raw-signal(j)) - (rbw - signal(j)) ;
    for i = 1:130
        data(i,:) = rcw(((i-1)*142)+1:(i*142));
    end
    dtt = data(3:h,:);
    
    Noise(j) = sum(sum(rcw.^2))/(2*numel(rcw));
end
scatter(log(signal),log(Noise))

    