% points \mapsto QMC estimation of f(x)
% where f(x) = prod(1+g_j h(x_j)) - 1
% where h(x_j) = B_6(x)=x^6-3x^5+5x^4/2-x^2/2+1/42 (bernoulli polynomial)

function func = Bernoulli6(s,weights,~)
B6 = @(P) (((P-3).*P + 5/2).*P.*P - 1/2).*P.*P  -1/42;
func = @(points) mean(prod(1 + weights(1:s).*B6(points(:,1:s)),2)) - 1;
end

