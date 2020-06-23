%{
点サイズを動かしたときの積分誤差の配列を返す関数
integ: 被積分関数
s: 次元
weights: 重みベクトル
c: 被積分関数のパラメータ
mmax: log2(点サイズの最大値)
type: 積分をする点集合の種類：使えるものは以下の通り
Sobol列系統:
    "Sobol" 
    "Sobol+shift" % 2^m点のSobol点集合を各方向に2^{-m-1}だけシフトしたもの
    "ScrambledSobol"
    "HOSobol" % order2のSobol列
格子系統:
    "Lattice" %（よい）格子
    "badLattice" % 生成ベクトルに同じ元がたくさん出てきてしまう格子
    "Lattice+shift"
    "Lattice_seq" %格子列
Halton列系統:
    "Halton"
    "LeapedHalton"
    "ScrambledHalton"
一様ランダム
    "Random"
%}
function err = Errors(integ,s,weights,c,type,mmax)

integrand = integ(s,weights,c);
err = zeros(1,mmax);

switch type
    case "Sobol"
        P = sobolset(s);
        for m = 1:mmax
            N = pow2(m); % Number of points
            err(m) = abs(integrand(net(P,N)));
        end
    case "Sobol+shift" % non-digital 
        P = sobolset(s);
        for m = 1:mmax
            N = pow2(m); % Number of points
            err(m) = abs(integrand(net(P,N)+pow2(-m-1)));
        end
    case "ScrambledSobol"
        P = sobolset(s);
        P = scramble(P,'MatousekAffineOwen');
        for m = 1:mmax
            N = pow2(m); % Number of points
            err(m) = abs(integrand(net(P,N)));
        end
    case "HOSobol"
        for m = 1:mmax
            err(m) = abs(integrand(HOSobol(m,s,2)));
        end
    case "badLattice"
        for m = 1:mmax
            err(m) = abs(integrand(LatticePoints_diag(m,s)));
        end
    case "Lattice"
        for m = 1:mmax
            err(m) = abs(integrand(LatticePoints(m,s)));
        end
    case "Lattice+shift"
        for m = 1:mmax
            shift = rand(1,s);
            err(m) = abs(integrand(mod(LatticePoints(m,s)+shift,1)));
        end
    case "Lattice_seq"
        for m = 1:mmax
            latticeseq_b2('init0')
            err(m) = abs(integrand(latticeseq_b2(s, pow2(m))'));
        end
    case "Random"
        for m = 1:mmax
            N = pow2(m); % Number of points
            err(m) = abs(integrand(rand(N,s)));
        end
    case "Halton"
        P = haltonset(s);
        for m = 1:mmax
            N = pow2(m); % Number of points
            err(m) = abs(integrand(net(P,N)));
        end
    case "LeapedHalton"
        P = haltonset(s,'leap',408);
        for m = 1:mmax
            N = pow2(m); % Number of points
            err(m) = abs(integrand(net(P,N)));
        end
    case "ScrambledHalton"
        P = haltonset(s);
        P = scramble(P,'RR2');
        for m = 1:mmax
            N = pow2(m); % Number of points
            err(m) = abs(integrand(net(P,N)));
        end
end
