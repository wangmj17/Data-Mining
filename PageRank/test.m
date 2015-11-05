graph = load('web-Google.txt');
graph = graph + 1;
N = 875713;
epsilon = 1e-6;
beta = 0.8;

nodeNumber = max(max(graph));
edgeNumber = size(graph,1);
degree = zeros(nodeNumber,1);
for i = 1:edgeNumber
    degree(graph(i,1)) = degree(graph(i,1)) + 1;
end

r = PageRank(N,graph,degree,beta,epsilon);