function plot_edges(nodes, A, varargin)

[i,j] = find(triu(A,1));
[~, p] = sort(max(i,j));
i = i(p);
j = j(p);

X = [ nodes(i,1) nodes(j,1)]';
Y = [ nodes(i,2) nodes(j,2)]';
plot(X,Y, varargin{:});


end