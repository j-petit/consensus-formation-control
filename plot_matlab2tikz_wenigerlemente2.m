% plots maximum accleration graph and takes into account that too many data
% points are generated

figure;
plot(max_veloc.time(1:30:end),max_veloc.data(1:30:end,:));
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');
legend('v_{x}','v_{y}','v_{z}');
title('');
matlab2tikz('max_veloc_sim.tikz','width','.7\textwidth');


figure;
plot(min_veloc.time(1:30:end),min_veloc.data(1:30:end,:));
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');
legend('v_{x}','v_{y}','v_{z}');
title('');
matlab2tikz('min_veloc_sim.tikz','width','.7\textwidth');

%% two subplots in one figure
figure;
subplot(1,2,1);
plot(max_veloc.time(1:30:end),max_veloc.data(1:30:end,:));
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');
legend('v_{x}','v_{y}','v_{z}');
title('');

subplot(1,2,2);
plot(min_veloc.time(1:30:end),min_veloc.data(1:30:end,:));
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');
legend('v_{x}','v_{y}','v_{z}');
title('');
matlab2tikz('min_max_veloc_sim.tikz','width','\textwidth');