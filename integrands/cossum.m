% points \mapsto QMC estimation of f(x)
% where f(x) = cos(2pi*sum(x.*gamma))

function func =cossum(s,~,~)
func = @(points) mean(cos(2*pi*sum(points(:,1:s),2)));
end
