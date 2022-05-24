function [Adj_lColumn] = connect_VL(connections,N)
    % creates the last column and row (connections to the VL) of a Adj depending on the
    % connections specified
    Adj_lColumn = zeros(N,1);
    for i=1:1:length(connections)
        Adj_lColumn(connections(i)) = 1;
    end
end