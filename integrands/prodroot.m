% points \mapsto QMC estimation of f(x) = exp(sum(g_j x_j))
function func = prodroot(s,~,~)
func = @(points) mean(prod(points(:,1:s).^(1/s),2))*(1+1/s)^s - 1;
end
