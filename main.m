clear('all');
close('all'); clc

% ADICIONANDO DIRETÓRIOS
addpath(genpath('Graph Model'));
addpath('Utils')
addpath('Control Law')
addpath('Results')

% DEFININDO PARÂMETROS
N = 20;
Method = 'BarabasiAlbert';
Parameters = [5 3 1 1];

% VALIDAÇÃO DE PARÂMETROS INICIAIS
Methods = ["erdosRenyi";"WattsStrogatz";"DoddsWattsSabel";"BarabasiAlbert"];
if(sum(Method == Methods) == 0)
    error(sprintf("Use -> %s\n", Methods));
end

% GERAÇÃO DA REDE DE COMUNICAÇÃO
% - Matrizes de Adjacência 1 e 2 Com e Sem Conexões VL
[Adj_VL, Adj_VL_2, Adj, Adj_2] = graph_create(N, Method, Parameters);

%%% Quadrotor Setup %%%
[xi_init, r_init, r_rel_1, r_rel_2, r_rel_3] = ControllerSetup(N);

% PD-Controller gains
kp_ref = 75;
kd_ref = 10;

% Outer x-y-position PD controller gains
kpx = 1.2;
kdx = 1;
kpy = 1.2;
kdy = 1;

% Quadrotor Gains
[Gains, kpp, kdp, kpt, kdt, kpps, kdps, kpz, kdz] = QuadrotorGains();

% Quadrotor Constants
[quad_physical, m, g, f_thrust_limit_up, max_phi, max_theta, k_aer_x, k_aer_y, k_aer_z] = QuadrotorConstants();

% Start Simulation
sim('FormationSim');

%% evaluation plot of reference controller
scrsz = get(groot,'ScreenSize');
eval = figure('OuterPosition',[0 0 scrsz(3)/2 scrsz(4)/2]);
set(eval, 'Name', 'Evaluation of Reference Controller', 'NumberTitle', 'off');

subplot(1,2,1), plot(error_total);
title('Total performance');
ylabel('J_total');

subplot(1,2,2), plot(error_i);
title('Performance per vehicle');
ylabel('J_r_i');

J = Performance(error_i, N);
J_best = sum(J - min(J));
fprintf("J_best: %0.4f\n", J_best);

%close('all');