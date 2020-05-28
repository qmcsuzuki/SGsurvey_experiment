% wrapper function of codes by Dirk Nyuens
% https://people.cs.kuleuven.be/~dirk.nuyens/fast-cbc/fastrank1pt.m

% n: 2^n is near to the number of points
% s_max: the dimension
% get good lattice points with p being close to 2^n

%生成ベクトルに同じ値が登場してしまうパラメータをあえて選んだ
%といっても、gamma = ones(s_max, 1)/s_max を ones(s_max, 1) にしただけ

function points = LatticePoints_diag(n,s_max)
omega = @(x) 2*pi^2*(x.^2-x+1/6);
gamma = ones(s_max, 1); %これを選ぶと生成ベクトルに同じ値が登場してしまう
beta = ones(s_max, 1);
% the nearest prime to 2^n
% Dickさんのコードの兼ね合いで、primes(1)=3 とした
primes = [3, 3, 7, 13, 31, 61, 127, 251, 509, 1021, 2039, 4093, 8191, 16381, 32749, 65521, 131071, 262139, 524287, 1048573, 2097143, 4194301, 8388593, 16777213, 33554393];
p = primes(n);
[z,~] = fastrank1pt(p, s_max, omega, gamma, beta);
points = mod(kron((0:p-1)',z')/p,1);
%Myplot2(points)
end
