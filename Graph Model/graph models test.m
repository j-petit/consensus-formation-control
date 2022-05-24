addpath('lib_DoddsWattsSabel');
addpath('lib_BarabasiAlbert');
addpath('lib_WattsStrogatz');

N = 50;

% 1 - Modelo Erdős–Rényi


% Livre de Escala - Modelo Barabási–Albert
A = BarabasiAlbert(N, 4, 3)
G = graph(A, 'upper');
plot(G);

% 3 - Redes de Pequeno Mundo - Modelo Watts-Strogatz
G = WattsStrogatz(N, 2, 0.01);
plot(G);

% 4 - Hierarquias Aleatórias - Modelo Dodds-Watts-Sabel;
A = DoddsWattsSabel(N, 3, 4, 0.1, 0.5);
G = graph(A, 'upper');
plot(G);