% plot error spacing for formation keeping accuracy
% scrsz = get(groot,'ScreenSize');
% figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);

plot_tikz = true;
figure;

h = plot(linspace(0,12,10),ones(1,10)*0.8);
set(h,'LineStyle','--','Color','k');
hold on;
h1 = plot(timeseries(spacing_mean_noOpt.data(1:10:end,:),spacing_mean_noOpt.time(1:10:end)));
%set(h1,'LineStyle','--','Color','k');
h2 = plot(timeseries(spacing_mean.data(1:10:end,:),spacing_mean.time(1:10:end)));
%set(h2,'LineStyle','-.','Color','k');

axis([0 12 0 1]);
xlabel('Time [s]');
ylabel('Mean inter vehicle distance [m]','Interpreter','tex');
legend('reference','without feedback','with feedback','Location','Southwest');
title('');
if (plot_tikz)
    cleanfigure;
    matlab2tikz('spacing_mean.tikz','width','.6\textwidth');
end;
%%

% spacing for optimized per vehicle
figure;
h = plot(linspace(0,12,10),ones(1,10)*0.8);
set(h,'LineStyle','--','Color','k');
hold on;
h = plot(timeseries(spacing.data(1:10:end,:),spacing.time(1:10:end)));
% set(h(1),'LineStyle','--','Color','k');
% set(h(2),'LineStyle','-.','Color','k');

axis([0 12 0 1]);
xlabel('Time [s]');
ylabel('Inter vehicle distance [m]','Interpreter','tex');
legend('required','V_1 - V_2','V_2 - V_3','V_3 - V_4','V_4 - V_5','V_5 - V_6','Location','Southwest');
title('');
if (plot_tikz)
    cleanfigure;
    matlab2tikz('spacing_vehicles.tikz','width','.6\textwidth');
end;