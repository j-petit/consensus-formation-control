% plots maxium distance graph and takes into account that too many data
% points are generated



%% Plot xi_ref
figure;
plot(xi_ref);
xlabel('Time [s]');
ylabel('Position and Angle [m]/[rad]');
legend('x^r','y^r','z^r','\alpha','\beta','\gamma','Location','Northwest');
title('');
cleanfigure('minimumPointsDistance',1.0e-1);
matlab2tikz('xi_ref.tikz','width','.6\textwidth');