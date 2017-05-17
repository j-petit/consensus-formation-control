% Plots reference state vs controlled reference state
% x ref
plot_tikz = true;

scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);
h = plot(timeseries(xi_ref.data(1:10:end,1),xi_ref.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
hold on;
h = plot(timeseries(xi_ref_contr.data(1:10:end,1),xi_ref_contr.time(1:10:end)));
set(h(1),'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('x position [m]');
legend('reference','controlled','Location','Northwest');
title('');
if (plot_tikz)
    cleanfigure;
    matlab2tikz('ref_vs_contr_x.tikz','width','.8\textwidth');
end;
% y ref
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);
h = plot(timeseries(xi_ref.data(1:10:end,2),xi_ref.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
hold on;
h = plot(timeseries(xi_ref_contr.data(1:10:end,2),xi_ref_contr.time(1:10:end)));
set(h(1),'LineStyle','-','Color','r');
axis([0 12 -2 2]);
xlabel('Time [s]');
ylabel('y position [m]');
legend('reference','controlled','Location','Northwest');
title('');
if (plot_tikz)
   cleanfigure;
    matlab2tikz('ref_vs_contr_y.tikz','width','.8\textwidth');
end;

% z ref
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);
h = plot(timeseries(xi_ref.data(1:10:end,3),xi_ref.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
hold on;
h = plot(timeseries(xi_ref_contr.data(1:10:end,3),xi_ref_contr.time(1:10:end)));
set(h(1),'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('z position [m]');
legend('reference','controlled','Location','Northwest');
title('');
if (plot_tikz)
   matlab2tikz('ref_vs_contr_z.tikz','width','.8\textwidth');
end;


% alpha ref
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);
h = plot(timeseries(xi_ref.data(1:10:end,4),xi_ref.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
hold on;
h = plot(timeseries(xi_ref_contr.data(1:10:end,4),xi_ref_contr.time(1:10:end)));
set(h(1),'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('\alpha angle [rad]','Interpreter','tex');
legend('reference','controlled','Location','Northwest');
title('');
if (plot_tikz)
   cleanfigure;
    matlab2tikz('ref_vs_contr_alpha.tikz','width','.8\textwidth');
end;

% beta ref
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);
h = plot(timeseries(xi_ref.data(1:10:end,5),xi_ref.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
hold on;
h = plot(timeseries(xi_ref_contr.data(1:10:end,5),xi_ref_contr.time(1:10:end)));
set(h(1),'LineStyle','-','Color','r');
axis([0 12 -pi/2 pi/2]);
xlabel('Time [s]');
ylabel('\beta angle [rad]','Interpreter','tex');
legend('reference','controlled','Location','Northwest');
title('');
if (plot_tikz)
   cleanfigure;
    matlab2tikz('ref_vs_contr_beta.tikz','width','.8\textwidth');
end;

% gamma ref
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);
h = plot(timeseries(xi_ref.data(1:10:end,6),xi_ref.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
hold on;
h = plot(timeseries(xi_ref_contr.data(1:10:end,6),xi_ref_contr.time(1:10:end)));
set(h(1),'LineStyle','-','Color','r');
axis([0 12 -pi/2 pi/2]);
xlabel('Time [s]');
ylabel('\gamma angle [rad]','Interpreter','tex');
legend('reference','controlled','Location','Northwest');
title('');
if (plot_tikz)
   cleanfigure;
    matlab2tikz('ref_vs_contr_gamma.tikz','width','.8\textwidth');
end;
