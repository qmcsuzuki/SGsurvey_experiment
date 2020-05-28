% points \mapsto QMC estimation of f(x) = (1+1/s)^s*\prod(x_i^{1/s})-1

function func = prodroot(s,~,~)
func = @(points) mean(prod(points(:,1:s).^(1/s),2))*(1+1/s)^s - 1;
end
