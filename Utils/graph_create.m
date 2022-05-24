function [Adj_VL, Adj_VL_2, Adj, Adj_2] = graph_create(N, Method, Parameters)
    % GRAPH_CREATE gives two random graphs using Erdos-Renyi-Algorithm of n-vehicles and
    % finds minimum directed spanning tree of these two graphs
    %
    % Inputs:
    %     N            - number of vehicles
    %     connections  - to leader connected vehicles in graph 1
    %     connections_2- to leader connected vehicles in graph 2
    % Outputs:
    %     Adj_VL    - Consensus adjacency matrix graph 1 with virtual leader connections
    %     Adj_VL_2  - same as above for graph 2
    %     Adj       - Adjacency matrix graph 1 without virtual leader
    %     Adj_2     - same as above for graph 2

    figure,
    %graphs = figure;
    %scrsz = get(groot, 'ScreenSize');
    %set(graphs, 'Name', 'Communication Topologies', 'NumberTitle', 'off','OuterPosition',[0 0 scrsz(3)/2 scrsz(4)/2]);

    % Gerando Rede de Comunicação
    switch(Method)
        case('erdosRenyi') % Aleatório
            G1 = erdosRenyi(N, Parameters);
            G2 = erdosRenyi(N, Parameters);
            
        case('WattsStrogatz') % Pequeno Mundo
            G1 = WattsStrogatz(N, Parameters(1), Parameters(2));
            G2 = WattsStrogatz(N, Parameters(1), Parameters(2));
            
        case('DoddsWattsSabel') % Hierárquicas Aleatórias
            G1 = DoddsWattsSabel(N, Parameters(1), Parameters(2), Parameters(3), Parameters(4));
            G2 = DoddsWattsSabel(N, Parameters(1), Parameters(2), Parameters(3), Parameters(4));
             
        case('BarabasiAlbert') % Sem Escala
            G1 = BarabasiAlbert(N, Parameters(1), Parameters(2));
            G2 = BarabasiAlbert(N, Parameters(1), Parameters(2));
            
        otherwise
            disp('Método Inválido ou Não implemtado');
    end
    
    Metric_centrality = 'betweenness';
    G = graph(G1, 'upper', 'OmitSelfLoops');
    C_1 = centrality(G, Metric_centrality);
    [M, connections] = max(C_1); % Conexão do 1º líder virtual (VL)

    G_2 = graph(G2,'upper','OmitSelfLoops');
    C_2 = centrality(G_2, Metric_centrality);
    [M, I] = max(C_2); C_2(I) = -Inf;
    [M, connections_2] = max(C_2); % Conexão do 2º líder virtual (VL)
    
    % Plot
    subplot(2,2,1);
    p = plot(G);
    set(gca,'XTickLabel',[],'YTickLabel',[]);
    
    subplot(2,2,3);
    p_2 = plot(G_2);
    set(gca,'XTickLabel',[],'YTickLabel',[]);

    % find minimum spanning tree from the first element in the connected list
    % and create undirected graph from the root of the tree
    [T,pred] = minspantree(G,'Type','forest','Root',connections(1));
    highlight(p,T);
    
    subplot(2,2,2);
    p_3 = plot(T);
    set(gca,'XTickLabel',[],'YTickLabel',[]);

    [T_2,pred_2] = minspantree(G_2,'Type','forest','Root',connections_2(1));
    highlight(p_2,T_2);
    
    subplot(2,2,4);
    p_4 = plot(T_2);
    set(gca,'XTickLabel',[],'YTickLabel',[]);

    % creates last column and row for adjacency matrix
    connect = connect_VL(connections, N);
    connect_2 = connect_VL(connections_2, N);
    fprintf("Connections VL: {%d, %d}\n",connections, connections_2);

    % Criando Matrizes de Adjacência
    % Primeiro Grafo
    Adj = full(T.adjacency)';
    Adj_VL = [Adj connect; connect' 0];
    
    % Segundo Grafo
    Adj_2 = full(T_2.adjacency)';
    Adj_VL_2 = [Adj_2 connect_2; connect_2' 0];

end


