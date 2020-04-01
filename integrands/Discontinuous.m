% points \mapsto QMC estimation of f(x)
% where f(x) = prod(1+g_j h(x_j))  - 1
% where h(x_j) = 1-v if x_j < v else -v
function func = Discontinuous(s,weights,v)
h = @(points) (points<v)-v;
func = @(points) mean(prod(1 + weights(1:s).*h(points(:,1:s)),2)) - 1;
end
