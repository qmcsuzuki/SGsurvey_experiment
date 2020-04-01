% points \mapsto QMC estimation of f(x) = exp(sum(g_j x_j))
function func = expsum(s,weights,~)
TrueValue = prod((exp(weights(1:s))-1)./weights(1:s));
func = @(points) mean(exp(sum(weights(1:s).*points(:,1:s),2)))/TrueValue - 1;
end
