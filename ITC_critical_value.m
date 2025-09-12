%% 

diff_observed1 = avg_itc_o_R(:,:,1:243) - avg_itc_o_nonR; 
diff_observed = mean(diff_observed1,3);


p_value = 0.05;
critical_value = sqrt(-log(p_value)) / 177;

significant_indices = diff_observed > critical_value;

figure;
imagesc(itc.time, itc.freq, diff_observed);
axis xy
colorbar

hold on;
contour(itc.time,itc.freq, significant_indices, 1,'r', 'lineWidth',2);
hold off

%% Ad-hoc

young = mean(squeeze(mean(itc_y,1)),3); %n = 177
middle = mean(squeeze(mean(itc_m(:,:,:,1:177),1)),3); % n =198
old = mean(squeeze(mean(itc_o(:,:,:,1:177),1)),3); % n = 245

diff_y_m = young - middle;
diff_m_o = middle - old;
diff_y_o = young - old;

p_value = 0.05/3;
critical_value = sqrt(-log(p_value)) / 177;

significant_indices_Y_M = diff_y_m > critical_value;
significant_indices_M_O = diff_m_o > critical_value;
significant_indices_Y_O = diff_y_o > critical_value;

% Young
figure;
imagesc(itc.time, itc.freq, diff_y_m);
axis xy
colorbar
hold on;
contour(itc.time,itc.freq, significant_indices_Y_M, 1,'r', 'lineWidth',2);
hold off

% Middle
figure;
imagesc(itc.time, itc.freq, diff_m_o);
axis xy
colorbar
hold on;
contour(itc.time,itc.freq, significant_indices_M_O, 1,'r', 'lineWidth',2);
hold off

% Old
figure;
imagesc(itc.time, itc.freq, diff_y_o);
axis xy
colorbar
hold on;
contour(itc.time,itc.freq, significant_indices_Y_O, 1,'r', 'lineWidth',2);
hold off