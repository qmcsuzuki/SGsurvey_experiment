% points \mapsto QMC estimation of f(x)
% where f(x) = prod(1+g_j h(x_j))) - 1
% where h(x_j) = (|1-3x|-3x+4)/5 
function func = conti3_nonper(s,weights,~)
h = @(points) (abs(1-3*points)-3*points+2/3)*3/5;
func = @(points) mean(prod(1 + weights(1:s).*h(points(:,1:s)),2)) - 1;
end
