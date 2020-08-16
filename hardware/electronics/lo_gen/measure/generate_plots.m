%Load RFAMINUS
v = dlmread('RF_A_MINUS_15000_TO_10_MHZ_20MV_PER_DBM.csv');
v = v(39:2299,:);
frfaminus = linspace(15000e6, 10e6, length(v));
powerrfaminus = v(:,2)/0.02;

%Load RFAPLUS
v = dlmread('RF_A_PLUS_15000_TO_10_MHZ_20MV_PER_DBM.csv');
v = v(36:2293,:);
frfaplus = linspace(15000e6, 10e6, length(v));
powerrfaplus = v(:,2)/0.02;

%Load RFBPLUS
v = dlmread('RF_B_PLUS_15000_TO_10_MHZ_20MV_PER_DBM.csv');
v = v(38:2299,:);
frfbplus = linspace(15000e6, 10e6, length(v));
powerrfbplus = v(:,2)/0.02;

%Load RFBMINUS
v = dlmread('RF_B_MINUS_15000_TO_10_MHZ_20MV_PER_DBM.csv');
v = v(29:2288,:);
frfbminus = linspace(15000e6, 10e6, length(v));
powerrfbminus = v(:,2)/0.02;

plot(frfaminus, powerrfaminus, frfaplus, powerrfaplus, frfbplus, powerrfbplus, frfbminus, powerrfbminus);
xlabel('frequency [Hz]');
ylabel('power [dBm]');
legend('rfa-', 'rfa+', 'rfb+', 'rfb-');
grid on;