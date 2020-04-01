% points \mapsto QMC estimation of f(x)
% where f(x) = prod(1+g_j h(x_j)) - 1
% where h(x_j) = B_4(x)=x^4-2x^3+x^2-1/30 (bernoulli polynomial)

function func = Bernoulli4(s,weights,~)
B4 = @(points) ((points-2).*points+1).*points.*points-1/30;
func = @(points) mean(prod(1 + weights(1:s).*B4(points(:,1:s)),2)) - 1;
end

