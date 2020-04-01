% points \mapsto QMC estimation of f(x)
% where f(x) = prod(1+g_j h(x_j)) - 1
% where h(x_j) = B_3(x)=x^3-3x^2/2+x/2 (bernoulli polynomial)

function func =Bernoulli3(s,weights,~)
B3 = @(points) ((points - 3/2).*points + 1/2).*points;
func = @(points) mean(prod(1 + weights(1:s).*B3(points(:,1:s)),2)) - 1;
end
