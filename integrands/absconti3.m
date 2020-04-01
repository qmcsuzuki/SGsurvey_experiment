% points \mapsto QMC estimation of f(x)
% where f(x) = prod(1+g_j h(x_j))) - 1
% where h(x_j) = (1+3(x-|1-3x|))/2

function func = absconti3(s,weights,~)
h = @(points) (1+3*(points-abs(1-3*points)))/2;
func = @(points) mean(prod(1 + weights(1:s).*h(points),2)) - 1;
end
