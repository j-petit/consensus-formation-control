figure
a = squeeze(phi_ref_i.data);
h = plot(phi_ref_i.time(1:10:end), a(:,1:10:end));
%set(h(1),'Color','m');
hold on;
xi_ref2 = reduce(xi_ref);
h = plot(xi_ref2.time, xi_ref2.data(:,4));
set(h(1),'LineStyle','--','Color','k');
xlabel('Time [s]');
ylabel('Angle [rad]');
legend('V_1','V_2','V_3','V_4','V_5','V_6','Reference','Location','Southeast');
title('');
matlab2tikz('alpha_ref_i.tikz','width','.6\textwidth');

%% alpha error

figure
a = squeeze(J_xi_a.data);
h = plot(J_xi_a.time(1:10:end), a(:,1:10:end));
xlabel('Time [s]');
ylabel('Performance');
legend('V_1','V_2','V_3','V_4','V_5','V_6','Location','Southeast');
title('');
matlab2tikz('J_xi_alpha.tikz','width','.6\textwidth');