# SGsurvey_experiment


#QMC点集合:
- Sobol'列: Statistics and Machine Learning Toolboxの組み込み関数を使用。
- Halton列: 同上
- 2-order Sobol列: Josef Dick先生のブログのコード（リンクは以下）を使用（このリポジトリには含まれていない）
  - https://quasirandomideas.wordpress.com/2010/06/17/how-to-generate-higher-order-sobol-points-in-matlab-and-some-numerical-examples/
- 格子: Dirk Nuyence 先生のコード（リンクは以下）を使用（このリポジトリには含まれていない）
  - https://people.cs.kuleuven.be/~dirk.nuyens/fast-cbc/
  - LatticePoints.m: 上コード群のラッパー関数。2^m に近い素数点からなる格子を返す

#被積分関数:
- 以下、g_i は weight（i 番目の座標の重要度）を表す
- expsum: f(x) = exp(sum(g_j x_j))
- cossum: f(x) = cos(2pi+sum(g_j x_j))
- prodroot: f(x) = (1+1/s)^s*\prod(x_i^{1/s})-1
- half_of_cube: f(x) =  1/2 if sum(x) < s/2 else -1/2
- 以下では、被積分関数の形は f(x) = \prod(1 + g_i h(x_i)) -1 
- Sobolev_c: h(x,c) = x^{c} - 1/(1+c)
- Discontinuous: h(x,c) = 1-c if x_j < c else -c
- Bernoulli2: h(x) = B_2(x) = x^2-x+1/6
- Bernoulli3: h(x) = B_3(x) = x^3-3x^2/2+x/2
- Bernoulli4: h(x) = B_4(x) = x^4-2x^3+x^2-1/30 
- Bernoulli6: h(x) = B_6(x) = x^6-3x^5+5x^4/2-x^2/2+1/42
- G_function: h(x) = |4x_j-2|-1
- absconti3: h(x) = (1+3(x-|1-3x|))/2
- conti3_nonper: h(x) = (|1-3x|-3x+4)/5 

実験をするための関数
- experiment.m: 被積分関数とパラメータを指定することで上記各種点集合によるQMC積分誤差をプロットするメイン関数
  - Errors.m: 被積分関数とQMC点集合の種類を指定してQMC積分誤差の配列を返す関数






