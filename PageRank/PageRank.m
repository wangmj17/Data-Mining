function [ r_new ] = PageRank( N,graph,degree, beta,epsilon )
%UNTITLED Summary of this function goes here
%   N is the number of nodes in the network
%   graph is a M * 2 matrix, where M is the number of edges in the network.
%   graph(i,1) and graph(i,2) mean that there is a link point from 
%   node[graph(i,1)] to node[graph(i,2)]
%   degree is a N*1 matrix, representing the number of out-links of each node.
%   beta is the probability to jump out of a circle (and points to other nodes
%   with equal probability)
%   epsilon is parameter to decide when to stop the iteration. It is usually a
%   very small positive number.

nodeNumber = max(max(graph));
edgeNumber = size(graph,1);

r_old = ones(nodeNumber,1)/N;
r_new = zeros(nodeNumber,1);
while 1==1
    for i=1:edgeNumber
        start = graph(i,1);
        dest = graph(i,2);
        r_new(dest) = r_new(dest) + beta * r_old(start)/degree(start);
    end
    S = sum(r_new);
    r_new = r_new + (1-S)/N;
    if sum(abs(r_new - r_old)) < epsilon
        break;
    end
    r_old = r_new;
    r_new = zeros(nodeNumber,1);
end

end

