% points \mapsto QMC estimation of f(x)
% where f(x) =  1/2 if sum(x) < s/2 else -1/2
function func = half_of_cube(s,~,~)
func = @(points) mean(sum(points(:,1:s),2)<(s/2)) - 1/2;
end
