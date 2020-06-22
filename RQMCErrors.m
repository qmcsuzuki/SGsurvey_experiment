%{
点サイズを動かしたときのRQMC(もしくはMC)の分散の配列を返す関数
integ: 被積分関数
s: 次元
weights: 重みベクトル
c: 被積分関数のパラメータ
mmax: log2(点サイズの最大値)
R: 試行回数
type: 積分をする点集合の種類：使えるものは以下の通り
    "ScrambledSobol": Sobol列 + ランダムスクランブル
    "Lattice+shift": 格子 + ランダムシフト
    "Random": ランダム点集合（R*2^i 点を1回ではなく、2^i 点をR回）
%}
function MSerr = RQMCErrors(integ,s,weights,c,type,mmax,R)

integrand = integ(s,weights,c);
err = zeros(R,mmax);

switch type
    case "ScrambledSobol"
        for m = 1:mmax
            N = pow2(m); % Number of points
            for i = 1:R
                P = scramble(sobolset(s),'MatousekAffineOwen');
                err(i,m) = integrand(net(P,N));
            end
        end
    case "Lattice+shift"
        for m = 1:mmax
            P = LatticePoints(m,s);
            for i = 1:R
                shift = rand(1,s);
                err(i,m) = integrand(mod(P+shift,1));
            end
        end
    case "Random"
        for m = 1:mmax
            N = pow2(m); % Number of points
            for i = 1:R
                err(i,m) = integrand(rand(N,s));
            end
        end
end

MSerr = var(err)/R;        
end
