function [Adj] = erdosRenyi(N,p)
    % creates random adjacency matrix according to Erdos-Renyi algorithm
    Adj = triu(rand(N)<p,1); % upper triangular to avoid self-loops
    Adj = Adj + Adj';
end