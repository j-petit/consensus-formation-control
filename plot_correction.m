% plots the correction vecotr c_a

figure;
h = plot(timeseries(correction.data(1:10:end,:),xi_ref.time(1:10:end)));
xlabel('Time [s]')
ylabel('correction [\si{m.s^{-2}}]/[\si{\radian\per\second\squared}]','Interpreter','LaTex');
h = legend('$\ddot{x^r}$ correction','$\ddot{y^r}$ correction','$\ddot{z^r}$ correction','$\ddot{\alpha}$ correction','$\ddot{\beta}$ correction','$\ddot{\gamma}$ correction','Location','Southwest');
set(h,'Interpreter','latex')
title('');

matlab2tikz('correction.tikz','width','.6\textwidth');
