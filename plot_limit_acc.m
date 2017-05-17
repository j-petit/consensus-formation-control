% Plots acceleration limits of dmax and required accleration
% turn off optimization in simulation for results without optimization
plot_tikz = true;

% x direction
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);
h = plot(timeseries(limit_acc_dmax.data(1:10:end,1:3:end),limit_acc_dmax.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
set(h(2),'LineStyle','-.','Color','k');
hold on;
hline = refline(0,0);
hline.Color = [0.8,0.8,0.8];
h2 = plot(timeseries(max_acc.data(1:10:end,1),max_acc.time(1:10:end)));
set(h2,'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('x acceleration [m/s^2]','Interpreter','tex');
legend([h(1) h(2) h2],{'upper limit','lower limit','required'},'Location','Southwest');
title('');
if (plot_tikz)
    cleanfigure;
    matlab2tikz('acc_x_limits_dmax.tikz','width','.8\textwidth');
end;
 
% y direction
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);

% a_y limit and required acc for dmax
h = plot(timeseries(limit_acc_dmax.data(1:10:end,2:3:end),limit_acc_dmax.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
set(h(2),'LineStyle','-.','Color','k');
hold on;
hline = refline(0,0);
hline.Color = [0.8,0.8,0.8];
h2 = plot(timeseries(max_acc.data(1:10:end,2),max_acc.time(1:10:end)));
set(h2,'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('y acceleration [m/s^2]','Interpreter','tex');
legend([h(1) h(2) h2],{'upper limit','lower limit','required'},'Location','Southwest');
title('');
if (plot_tikz)
   cleanfigure;
   matlab2tikz('acc_y_limits_dmax.tikz','width','.8\textwidth');
end;

% z direction
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);

% a_z limit and required acc for dmax
h = plot(timeseries(limit_acc_dmax.data(1:10:end,3:3:end),limit_acc_dmax.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
set(h(2),'LineStyle','-.','Color','k');
hold on;
hline = refline(0,0);
hline.Color = [0.8,0.8,0.8];
h2 = plot(timeseries(max_acc.data(1:10:end,3),max_acc.time(1:10:end)));
set(h2,'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('z acceleration [m/s^2]','Interpreter','tex');
legend([h(1) h(2) h2],{'upper limit','lower limit','required'},'Location','Southwest');
title('');
if (plot_tikz)
   cleanfigure;
   matlab2tikz('acc_z_limits_dmax.tikz','width','.8\textwidth');
end;


%% for d_min
% x direction
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);

% a_x limit and required acc for dmax
h = plot(timeseries(limit_acc_dmin.data(1:10:end,1:3:end),limit_acc_dmin.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
set(h(2),'LineStyle','-.','Color','k');
hold on;
hline = refline(0,0);
hline.Color = [0.8,0.8,0.8];
h2 = plot(timeseries(max_acc2.data(1:10:end,1),max_acc2.time(1:10:end)));
set(h2,'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('x acceleration [m/s^2]','Interpreter','tex');
legend([h(1) h(2) h2],{'upper limit','lower limit','required'},'Location','Southwest');
title('');
if (plot_tikz)
  cleanfigure;
    matlab2tikz('acc_x_limits_dmin.tikz','width','.8\textwidth'); 
end;

% y direction
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);

% a_y limit and required acc for dmax
h = plot(timeseries(limit_acc_dmin.data(1:10:end,2:3:end),limit_acc_dmin.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
set(h(2),'LineStyle','-.','Color','k');
hold on;
hline = refline(0,0);
hline.Color = [0.8,0.8,0.8];
h2 = plot(timeseries(max_acc2.data(1:10:end,2),max_acc2.time(1:10:end)));
set(h2,'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('y acceleration [m/s^2]','Interpreter','tex');
legend([h(1) h(2) h2],{'upper limit','lower limit','required'},'Location','Southwest');
title('');
if (plot_tikz)
   cleanfigure;
    matlab2tikz('acc_y_limits_dmin.tikz','width','.8\textwidth');
end;

% z direction
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);

% a_z limit and required acc for dmax
h = plot(timeseries(limit_acc_dmin.data(1:10:end,3:3:end),limit_acc_dmin.time(1:10:end)));
set(h(1),'LineStyle','--','Color','k');
set(h(2),'LineStyle','-.','Color','k');
hold on;
hline = refline(0,0);
hline.Color = [0.8,0.8,0.8];
h2 = plot(timeseries(max_acc2.data(1:10:end,3),max_acc2.time(1:10:end)));
set(h2,'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('z acceleration [m/s^2]','Interpreter','tex');
legend([h(1) h(2) h2],{'upper limit','lower limit','required'},'Location','Southwest');
title('');
if (plot_tikz)
   cleanfigure;
    matlab2tikz('acc_z_limits_dmin.tikz','width','.8\textwidth');
end;

