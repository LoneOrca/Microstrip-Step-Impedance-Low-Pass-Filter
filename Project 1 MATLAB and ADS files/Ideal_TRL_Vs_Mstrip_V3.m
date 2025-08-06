file1 = 'Ideal_TRLs_Tuning.s2p';
file2 = 'M_Strip_TRLs_V1_Tuning.s2p';
g = read(rfdata.data,file1);
h = read(rfdata.data,file2);
figure
plot(g,'s11','db');
hold all
plot(h,'s11','db');