%% main script
% Performs a simulation of a consensus based distributed formation
% algorithm. Information about a virtual reference frame is stored in each
% vehicle and updated according to its neighbors information states and the
% if connected the virtual leader. A feedback from the formation to the reference frame controller. 
% parameters only in initialize section (No. of vehicles,
% virtual-leader-connections, quadrotor, feedback controlelr).

%% initialize
clear all;
close all;

% Quadrotor setup
% outer x-y-position PD controller gains
kpx = 1.2;
kdx = 1;
kpy = 1.2;
kdy = 1;

% inner altitude and angle PD controller gains
kpp = 100;
kdp = 15;
kpt = 100;
kdt = 15;
kpps = 100;
kdps = 15;
kpz = 100;
kdz = 20;

disp('Quadrotor Gains');
Gains = [kpp kdp kpt kdt kpps kdps kpz kdz]

% Quadrotor Constants
m = 0.45; % Mass of the Quadrotor in Kg wie Parrot Bepo
g = 9.81; % Gravitational acceleration
k_aer_z = 0.2; % drag constant in z direction
k_aer_x = 0.1; % drag constant in xy-plane
k_aer_y = 0.1; % drag constant in xy-plane
z_dot_limit_up = 3; % terminal velocity in z-direction
f_thrust_limit_up = m*g+z_dot_limit_up^2*k_aer_z*m;
max_theta = 0.05;
max_phi = 0.05;

quad_physical = [m g k_aer_z k_aer_x k_aer_y f_thrust_limit_up max_theta max_phi];

%% simulation
sim simulation;

%% results plot
% creates new figure in the right display half with 6 subplots
scrsz = get(groot,'ScreenSize');
% result = figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)]);
% set(result, 'Name', 'Simulation Results Consensus', 'NumberTitle', 'off');

% splits up simulation timeseries results into the different states

figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);

subplot(1,2,1), h = plot(reduce(quad_x));
set(h(1),'LineStyle','--','Color','k');
legend('reference','actual','Location','Southeast');
%title('Quadrotor x-position');
title('');
xlabel('time [s]');
ylabel('x position [m]');
ylim([0 1.5]);

subplot(1,2,2), h = plot(reduce(quad_theta));
legend('reference', 'actual','Location','Southeast');
set(h(1),'LineStyle','--','Color','k');
%title('Quadrotor \theta angle');
title('');
xlabel('time [s]');
ylabel('\theta angle [rad]');
ylim([-0.075 0.075]);

set(gca,'Color',[1 1 1]);
set(gcf,'color','w');
export_fig quad_x_step.eps
matlab2tikz('quad_x_step.tikz','width','.85\textwidth');

figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)/3]);
subplot(1,2,1), h = plot(reduce(quad_y));
legend('reference','actual','Location','Southeast');
set(h(1),'LineStyle','--','Color','k');
title('');
%title('Quadrotor y-position');
xlabel('time [s]');
ylabel('y position [m]');
ylim([0 1.5]);

subplot(1,2,2), h = plot(reduce(quad_phi));
legend('reference', 'actual','Location','Southeast');
set(h(1),'LineStyle','--','Color','k');
%title('Quadrotor \phi angle');
title('');
xlabel('time [s]');
ylabel('\phi angle [rad]');
ylim([-0.075 0.075]);

set(gca,'Color',[1 1 1]);
set(gcf,'color','w');
%export_fig quad_y_step.eps
matlab2tikz('quad_y_step.tikz','width','.85\textwidth');


figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/4 scrsz(4)/3]);
h = plot(reduce(quad_z));
legend('reference','actual','Location','Southeast');
set(h(1),'LineStyle','--','Color','k');
%title('Quadrotor z-position');
title('');
xlabel('time [s]');
ylabel('z position [m]');
ylim([0 1.5]);

set(gca,'Color',[1 1 1]);
set(gcf,'color','w');
%export_fig quad_z_step.eps
matlab2tikz('quad_z_step.tikz','width','.425\textwidth');


% subplot(1,2,2);
% plot(quad_psi);
% legend('psi_{des}', 'psi');
% title('Quadrotor \psi angle');
% ylabel('angle in rad');
