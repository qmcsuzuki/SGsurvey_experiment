% points \mapsto QMC estimation of f(x)
% where f(x) =  prod(1+g_j h(x_j)) - 1
% where h(x_j) = x_j^c - 1/(1+c)
% c: smoothness
function func = Sobolev_c(s,weights,c)
func = @(points) mean(prod(1 + weights(1:s).*(points(:,1:s).^c - 1/(1+c)),2)) - 1;
end
