% Plots maximum distance real and of one vehicle
figure;
plot(reduce(max_dist));

hold on;

h = plot(timeseries(squeeze(eps_i.data(1:3,3,1:10:end)),eps_i.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
set(h(2),'LineStyle',':','Color','k');
set(h(3),'LineStyle','-.','Color','k');

xlabel('Time [s]');
ylabel('Distance [m]');
legend('d_{max,x,3}','d_{max,y,3}','d_{max,z,3}','d_{max,x}','d_{max,y}','d_{max,z}','Location','Southwest');
title('');
matlab2tikz('max_dist.tikz','width','.6\textwidth');
