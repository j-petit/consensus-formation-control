% Plots error
plot_tikz = true;

% error per vehicle
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/2]);
h = plot(timeseries(squeeze(error_i.data(:,:,1:10:end)),error_i.time(1:10:end)));
% set(h(1),'LineStyle','--','Color','k');
% set(h(2),'LineStyle','-.','Color','k');
% hold on;
% hline = refline(0,0);
% hline.Color = [0.8,0.8,0.8];
% h2 = plot(timeseries(max_acc.data(1:10:end,1),max_acc.time(1:10:end)));
% set(h2,'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('Error','Interpreter','tex');
legend('V_1','V_2','V_3','V_4','V_5','V_6','Location','Northwest');
title('');
if (plot_tikz)
    cleanfigure;
    matlab2tikz('err_per_veh.tikz','width','.8\textwidth');
end;

% total error
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/2]);
h = plot(timeseries(squeeze(error_total.data(:,:,1:10:end)),error_total.time(1:10:end)));
% set(h(1),'LineStyle','--','Color','k');
% set(h(2),'LineStyle','-.','Color','k');
% hold on;
% hline = refline(0,0);
% hline.Color = [0.8,0.8,0.8];
% h2 = plot(timeseries(max_acc.data(1:10:end,1),max_acc.time(1:10:end)));
% set(h2,'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('Error','Interpreter','tex');
legend('Total error','Location','Northwest');
title('');
if (plot_tikz)
    cleanfigure;
    matlab2tikz('err_total.tikz','width','.8\textwidth');
end;

resh_err_abs_sum = [];
for i = 1:size(error_abs_sum.data,3)
    resh_err_abs_sum = [resh_err_abs_sum; error_abs_sum.data(:,:,i)];
end

% total error
scrsz = get(groot,'ScreenSize');
figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/2]);
h = plot(timeseries(resh_err_abs_sum(1:10:end,:),error_abs.time(1:10:end)));
% set(h(1),'LineStyle','--','Color','k');
% set(h(2),'LineStyle','-.','Color','k');
% hold on;
% hline = refline(0,0);
% hline.Color = [0.8,0.8,0.8];
% h2 = plot(timeseries(max_acc.data(1:10:end,1),max_acc.time(1:10:end)));
% set(h2,'LineStyle','-','Color','r');
xlabel('Time [s]');
ylabel('Error','Interpreter','tex');
legend('Total error','Location','Northwest');
title('');
if (plot_tikz)
    cleanfigure;
    matlab2tikz('err_abs.tikz','width','.8\textwidth');
end;