% points \mapsto QMC estimation of f(x)
% where f(x) =  1 if sum(x) < 1
% c: smoothness
function func = triangle(s,~,~)
func = @(points) mean(sum(points(:,1:s),2)<1) - prod(1/1:s);
end
