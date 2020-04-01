% points \mapsto QMC estimation of f(x)
% where f(x) = prod(1+g_j h(x_j))) - 1
% where h(x_j) = |4x_j-2|-1
function func = G_function(s,weights,~)
func = @(points) mean(prod(1 + weights(1:s).*(abs(4*points(:,1:s)-2)-1),2)) - 1;
end
