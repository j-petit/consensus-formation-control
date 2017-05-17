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

% No. of vehicles
N = 6;

% specify to virtual leader connected vehicles. Two vecotr with elements
% from 1-N
connections = [1];
connections_2 = [3 6];

% check if valid connections input
if ((max([connections connections_2]) > N))
    error('Index of VL connected vehicle may not exceed number of vehicles.');
end

disp('Adjacency matrixes 1 and 2 with and without VL connections');
[Adj_VL, Adj_VL_2, Adj, Adj_2] = graph_create(connections, connections_2, N);

% check if communication network is strongly connected - if not -> new
% graphs
while (any(sum([Adj_VL Adj_VL_2]) == 0))
    disp('Unconnected vehicle. Creating new random graphs.');
    close all;
    [Adj_VL, Adj_VL_2, Adj, Adj_2] = graph_create(connections, connections_2, N);
end

% init of reference frame values
xi_init = zeros(6,N);
% circle start formation of vehicles around the center
% r_init = zeros(3,N);
% for i=1:1:N
%     r_init(:,i) = [cos(2*pi/N*(i-1)); sin(2*pi/N*(i-1)); 0];
% end

% desired relative position / formation around virtual center
[r_rel_1, r_rel_2, r_rel_3] = create_r_relative(N);
r_init = r_rel_3;

% Reference controller setup
% PD-Controller gains
kp_ref = 75;
kd_ref = 10;

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
disp('Simulation run succesfully...');
disp('Creating result plots...');
%% results plot
% creates new figure in the right display half with 6 subplots
scrsz = get(groot,'ScreenSize');
result = figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)]);
set(result, 'Name', 'Simulation Results Consensus', 'NumberTitle', 'off');

% splits up simulation timeseries results into the different states
time = xi_i.time;
x_ref_i = timeseries(xi_i.data(1,:,:), time, 'Name', 'x-coordinate');
y_ref_i = timeseries(xi_i.data(2,:,:), time, 'Name', 'y-coordinate');
z_ref_i = timeseries(xi_i.data(3,:,:), time, 'Name', 'z-coordinate');
alpha_ref_i = timeseries(xi_i.data(4,:,:), time, 'Name', 'theta-value');
beta_ref_i = timeseries(xi_i.data(5,:,:), time, 'Name', 'theta-value');
gamma_ref_i = timeseries(xi_i.data(6,:,:), time, 'Name', 'theta-value');

subplot(3,2,1), plot(xi_ref);
legend('x_{ref}','y_{ref}','z_{ref}','alpha_{ref}','beta_{ref}','gamma_{ref}');
title('Plot of the reference state (leader)');
ylabel('pos/angle in meters/rad');

% subplot(3,2,2), plot3(xi_ref.data(:,1),xi_ref.data(:,2),xi_ref.data(:,3));
% legend('reference trajectory');
% title('Leader trajectory');

subplot(3,2,2), plot(xi_ref_contr);
legend('x_{ref}','y_{ref}','z_{ref}','alpha_{ref}','beta_{ref}','gamma_{ref}');
title('Plot of the controlled reference state (leader)');
ylabel('pos/angle in meters/rad');

subplot(3,2,3), plot(x_ref_i);
%legend('v1','v2','v3','v4', 'v5');
title('Followers x-coordinate');
ylabel('distance in meters');

subplot(3,2,4), plot(y_ref_i);
%legend('v1','v2','v3','v4', 'v5');
title('Followers y-coordinate');
ylabel('distance in meters');

subplot(3,2,5), plot(z_ref_i);
%legend('v1','v2','v3','v4', 'v5');
title('Followers z-coordinate');
ylabel('distance in meters');

subplot(3,2,6), plot(alpha_ref_i);
%legend('v1','v2','v3','v4','v5');
title('Followers alpha-valua');
ylabel('angle in rad');

%% results plot 2 of referene controller
result2 = figure('OuterPosition',[scrsz(3)/2 0 scrsz(3)/2 scrsz(4)]);
set(result2, 'Name', 'Simulation Results Reference Controller', 'NumberTitle', 'off');

subplot(2,2,1), plot(correction);
legend('c_x','c_y','c_z','c_{alapha}','c_{beta}','c_{gamma}');
title('Correction term');
ylabel('correction in m/s^2 and rad/s^2');

subplot(2,2,2), plot(max_acc);
legend('a_x','a_y','a_z');
title('Maximum accelerations');
ylim([-10,5]);
ylabel('Acceleration in m/s^2');

subplot(2,2,3), plot(max_acc2);
legend('a_x','a_y','a_z');
title('Maximum accelerations 2');
ylim([-10,5]);
ylabel('Acceleration in m/s^2');

%% evaluation plot of reference controller
eval = figure('OuterPosition',[0 0 scrsz(3)/2 scrsz(4)/2]);
set(eval, 'Name', 'Evaluation of Reference Controller', 'NumberTitle', 'off');

subplot(1,2,1), plot(error_total);
title('Total performance');
ylabel('J_total');

subplot(1,2,2), plot(error_i);
title('Performance per vehicle');
ylabel('J_r_i');



