figure;
plot(xi_ref);
legend('x_{ref}','y_{ref}','z_{ref}','theta_{ref}','phi_{ref}','psi_{ref}');

set(gca,'Color',[1 1 1]);
set(gcf,'color','w');
export_fig test.eps
