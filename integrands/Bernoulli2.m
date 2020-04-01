% points \mapsto QMC estimation of f(x)
% where f(x) = prod(1+g_j h(x_j)) - 1
% where h(x_j) = B_2(x)=x^2-x+1/6 (bernoulli polynomial)

function func =Bernoulli2(s,weights,~)
B2 = @(points) (points-1).*points+1/6;
func = @(points) mean(prod(1 + weights(1:s).*B2(points(:,1:s)),2)) - 1;
end
